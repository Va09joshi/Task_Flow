import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/data/models/org_member_model.dart';

abstract class UserRepository {
  Future<User?> getUser(String id);
  Future<List<User>> getOrgMembers(String orgId);
  Future<OrgMember?> getOrgMember(String orgId, String userId);
}
