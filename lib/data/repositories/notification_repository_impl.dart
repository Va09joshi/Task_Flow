import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/notification_model.dart';
import 'package:taskflow/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final MockDataSource dataSource;

  NotificationRepositoryImpl(this.dataSource);

  @override
  Future<List<Notification>> getNotifications(String userId) async {
    final response = await dataSource.getNotifications(userId);
    return response.notifications;
  }

  @override
  Future<void> markNotificationRead(String id) async {
    return dataSource.markNotificationRead(id);
  }
}
