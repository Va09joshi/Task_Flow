import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/data/models/org_member_model.dart';
import 'package:taskflow/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final MockDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<User?> getUser(String id) async {
    return dataSource.getUser(id);
  }

  @override
  Future<List<User>> getOrgMembers(String orgId) async {
    return dataSource.getOrgMembers(orgId);
  }

  @override
  Future<OrgMember?> getOrgMember(String orgId, String userId) async {
    return dataSource.getOrgMember(orgId, userId);
  }
}
