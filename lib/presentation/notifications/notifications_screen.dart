import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/notifications/notification_providers.dart';
import 'package:taskflow/presentation/widgets/custom_app_bar.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: notificationsAsync.when(
        data: (notifications) {
          if (notifications.isEmpty) {
            return const Center(child: Text('No new notifications'));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.read(notificationsProvider.notifier).fetchNotifications(),
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  tileColor: notification.read ? null : Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    child: Icon(
                      notification.type == 'task_assigned' ? Icons.assignment_ind : Icons.notifications,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  title: Text(
                    notification.message,
                    style: TextStyle(
                      fontWeight: notification.read ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    notification.createdAt.toLocal().toString().split('.')[0],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  trailing: notification.read 
                    ? null 
                    : Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary)),
                  onTap: () {
                    if (!notification.read) {
                      ref.read(notificationsProvider.notifier).markAsRead(notification.id);
                    }
                    if (notification.taskId.isNotEmpty) {
                      context.push('/tasks/${notification.taskId}');
                    }
                  },
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
