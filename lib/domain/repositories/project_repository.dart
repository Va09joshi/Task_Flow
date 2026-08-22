import 'package:taskflow/data/models/project_model.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects(String orgId);
  Future<Project> getProject(String id);
  Future<void> createProject(Project project);
  Future<void> updateProject(Project project);
  Future<void> deleteProject(String id);
}
