import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    @JsonKey(name: 'task_id') required String taskId,
    required String message,
    required bool read,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
