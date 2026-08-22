import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/notification_model.dart';

part 'notification_list_response.freezed.dart';
part 'notification_list_response.g.dart';

@freezed
abstract class NotificationListResponse with _$NotificationListResponse {
  const factory NotificationListResponse({
    required List<Notification> notifications,
    @Default(0) int unreadCount,
  }) = _NotificationListResponse;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);
}
