import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/project_model.dart';
import 'package:taskflow/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final MockDataSource dataSource;
  final SharedPreferences sharedPrefs;

  ProjectRepositoryImpl(this.dataSource, this.sharedPrefs);

  @override
  Future<List<Project>> getProjects(String orgId) async {
    try {
      final projects = await dataSource.getProjects(orgId);
      final jsonList = projects.map((p) => p.toJson()).toList();
      await sharedPrefs.setString('cached_projects_$orgId', jsonEncode(jsonList));
      return projects;
    } catch (e) {
      final cachedStr = sharedPrefs.getString('cached_projects_$orgId');
      if (cachedStr != null) {
        final List decoded = jsonDecode(cachedStr);
        return decoded.map((e) => Project.fromJson(e)).toList();
      }
      rethrow;
    }
  }

  @override
  Future<Project> getProject(String id) async {
    return dataSource.getProject(id);
  }

  @override
  Future<void> createProject(Project project) async {
    return dataSource.createProject(project);
  }

  @override
  Future<void> updateProject(Project project) async {
    return dataSource.updateProject(project);
  }

  @override
  Future<void> deleteProject(String id) async {
    return dataSource.deleteProject(id);
  }
}
