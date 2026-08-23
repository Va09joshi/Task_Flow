import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_member_model.freezed.dart';
part 'org_member_model.g.dart';

@freezed
abstract class OrgMember with _$OrgMember {
  const factory OrgMember({
    @JsonKey(name: 'org_id') required String orgId,
    @JsonKey(name: 'user_id') required String userId,
    required String role, // 'org_admin' or 'member'
  }) = _OrgMember;

  factory OrgMember.fromJson(Map<String, dynamic> json) =>
      _$OrgMemberFromJson(json);
}
