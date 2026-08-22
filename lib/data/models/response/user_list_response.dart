import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/user_model.dart';

part 'user_list_response.freezed.dart';
part 'user_list_response.g.dart';

@freezed
abstract class UserListResponse with _$UserListResponse {
  const factory UserListResponse({
    required List<User> users,
    @Default(0) int totalCount,
  }) = _UserListResponse;

  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);
}
