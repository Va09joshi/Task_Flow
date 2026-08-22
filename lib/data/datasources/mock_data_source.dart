import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:taskflow/data/models/organization_model.dart';
import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/data/models/org_member_model.dart';
import 'package:taskflow/data/models/project_model.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/data/models/comment_model.dart';
import 'package:taskflow/data/models/notification_model.dart';
import 'package:taskflow/data/models/auth_model.dart';

class MockDataSource {
  static const _assetPath = 'assets/mock_data/TaskFlow-MockData.json';
  
  bool _initialized = false;
  
  // In-memory state
  List<Organization> organizations = [];
  List<User> users = [];
  List<OrgMember> orgMembers = [];
  List<Project> projects = [];
  List<Task> tasks = [];
  List<Comment> comments = [];
  List<Notification> notifications = [];
  AuthMockData? authMock;

  // Debug settings
  bool simulate404 = false;
  bool simulateTimeout = false;
  bool simulateValidationError = false;
  bool offlineMode = false;

  Future<void> init() async {
    if (_initialized) return;
    
    final jsonString = await rootBundle.loadString(_assetPath);
    final data = json.decode(jsonString) as Map<String, dynamic>;
    
    organizations = (data['organizations'] as List).map((e) => Organization.fromJson(e)).toList();
    users = (data['users'] as List).map((e) => User.fromJson(e)).toList();
    orgMembers = (data['org_members'] as List).map((e) => OrgMember.fromJson(e)).toList();
    projects = (data['projects'] as List).map((e) => Project.fromJson(e)).toList();
    tasks = (data['tasks'] as List).map((e) => Task.fromJson(e)).toList();
    comments = (data['comments'] as List).map((e) => Comment.fromJson(e)).toList();
    notifications = (data['notifications'] as List).map((e) => Notification.fromJson(e)).toList();
    authMock = AuthMockData.fromJson(data['auth_mock']);
    
    _initialized = true;
  }

  Future<void> _simulateNetwork() async {
    if (offlineMode) {
      throw Exception('Network is offline');
    }
    
    // Simulate delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (simulateTimeout) {
      throw Exception('Connection timeout');
    }
  }

  // Auth
  Future<AuthResponse> login(String email, String password) async {
    await _simulateNetwork();
    
    if (simulateValidationError) {
      throw Exception('Validation error: Invalid format');
    }
    
    if (!authMock!.testCredentials.any((c) => c.email == email && c.password == password)) {
      throw Exception('Invalid credentials');
    }
    
    return authMock!.mockLoginResponse;
  }

  // Projects
  Future<List<Project>> getProjects(String orgId) async {
    await _simulateNetwork();
    return projects.where((p) => p.orgId == orgId).toList();
  }

  Future<Project> getProject(String id) async {
    await _simulateNetwork();
    final p = projects.where((p) => p.id == id).firstOrNull;
    if (p == null || simulate404) throw Exception('Project not found');
    return p;
  }

  Future<void> createProject(Project project) async {
    await _simulateNetwork();
    projects.add(project);
  }

  Future<void> updateProject(Project project) async {
    await _simulateNetwork();
    final index = projects.indexWhere((p) => p.id == project.id);
    if (index == -1) throw Exception('Not found');
    projects[index] = project;
  }

  Future<void> deleteProject(String id) async {
    await _simulateNetwork();
    projects.removeWhere((p) => p.id == id);
  }

  // Tasks
  Future<List<Task>> getTasks(String orgId, {String? projectId}) async {
    await _simulateNetwork();
    // In our mock logic, we might need to filter tasks by project, 
    // but also we need to ensure they belong to projects in the org.
    final orgProjects = projects.where((p) => p.orgId == orgId).map((p) => p.id).toSet();
    return tasks.where((t) {
      if (projectId != null && t.projectId != projectId) return false;
      return orgProjects.contains(t.projectId);
    }).toList();
  }

  Future<Task> getTask(String id) async {
    await _simulateNetwork();
    final t = tasks.where((t) => t.id == id).firstOrNull;
    if (t == null || simulate404) throw Exception('Task not found');
    return t;
  }

  Future<void> createTask(Task task) async {
    await _simulateNetwork();
    tasks.add(task);
  }

  Future<void> updateTask(Task task) async {
    await _simulateNetwork();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index == -1) throw Exception('Not found');
    tasks[index] = task;
  }

  Future<void> deleteTask(String id) async {
    await _simulateNetwork();
    tasks.removeWhere((t) => t.id == id);
  }

  // Users & Members
  Future<User?> getUser(String id) async {
    return users.where((u) => u.id == id).firstOrNull;
  }

  Future<List<User>> getOrgMembers(String orgId) async {
    await _simulateNetwork();
    final memberIds = orgMembers.where((m) => m.orgId == orgId).map((m) => m.userId).toSet();
    return users.where((u) => memberIds.contains(u.id)).toList();
  }

  Future<OrgMember?> getOrgMember(String orgId, String userId) async {
    return orgMembers.where((m) => m.orgId == orgId && m.userId == userId).firstOrNull;
  }
}
