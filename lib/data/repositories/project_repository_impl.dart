import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/project_model.dart';
import 'package:taskflow/data/models/request/create_project_request.dart';
import 'package:taskflow/data/models/request/update_project_request.dart';
import 'package:taskflow/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final MockDataSource dataSource;
  final SharedPreferences sharedPrefs;

  ProjectRepositoryImpl(this.dataSource, this.sharedPrefs);

  @override
  Future<List<Project>> getProjects(String orgId) async {
    try {
      final response = await dataSource.getProjects(orgId);
      // Cache the response for offline fallback
      final jsonList = response.projects.map((p) => p.toJson()).toList();
      await sharedPrefs.setString(
        'cached_projects_$orgId',
        jsonEncode(jsonList),
      );
      return response.projects;
    } catch (e) {
      // Attempt offline fallback from cache
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
    final request = CreateProjectRequest(
      name: project.name,
      description: project.description,
      orgId: project.orgId,
      status: project.status,
    );
    await dataSource.createProject(request);
  }

  @override
  Future<void> updateProject(Project project) async {
    final request = UpdateProjectRequest(
      id: project.id,
      name: project.name,
      description: project.description,
      status: project.status,
    );
    await dataSource.updateProject(request);
  }

  @override
  Future<void> deleteProject(String id) async {
    return dataSource.deleteProject(id);
  }
}
