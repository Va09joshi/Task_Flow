import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/data/models/notification_model.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';

import '../auth/auth_state.dart';

final notificationsProvider = StateNotifierProvider.autoDispose<NotificationsNotifier, AsyncValue<List<Notification>>>((ref) {
  return NotificationsNotifier(ref);
});

class NotificationsNotifier extends StateNotifier<AsyncValue<List<Notification>>> {
  final Ref _ref;

  NotificationsNotifier(this._ref) : super(const AsyncValue.loading()) {
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    state = const AsyncValue.loading();
    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.mapOrNull(authenticated: (s) => s.user);
      
      if (user == null) {
        state = const AsyncValue.data([]);
        return;
      }
      final repository = _ref.read(notificationRepositoryProvider);
      final notifications = await repository.getNotifications(user.id);
      
      // Sort by latest first
      final sortedNotifications = List<Notification>.from(notifications)
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      state = AsyncValue.data(sortedNotifications);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      final repository = _ref.read(notificationRepositoryProvider);
      await repository.markNotificationRead(id);
      
      // Update local state directly to feel instant
      state = state.whenData((notifications) {
        return notifications.map((n) {
          if (n.id == id) {
            return n.copyWith(read: true);
          }
          return n;
        }).toList();
      });
    } catch (e) {
      // Ignore
    }
  }
}
