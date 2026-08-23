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
import 'package:taskflow/data/models/request/login_request.dart';
import 'package:taskflow/data/models/request/refresh_token_request.dart';
import 'package:taskflow/data/models/request/create_project_request.dart';
import 'package:taskflow/data/models/request/update_project_request.dart';
import 'package:taskflow/data/models/request/create_task_request.dart';
import 'package:taskflow/data/models/request/update_task_request.dart';
import 'package:taskflow/data/models/request/create_comment_request.dart';
import 'package:taskflow/data/models/response/login_response.dart';
import 'package:taskflow/data/models/response/refresh_token_response.dart';
import 'package:taskflow/data/models/response/project_list_response.dart';
import 'package:taskflow/data/models/response/task_list_response.dart';
import 'package:taskflow/data/models/response/notification_list_response.dart';
import 'package:taskflow/data/models/response/user_list_response.dart';

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

  // Debug simulation flags
  bool simulate404 = false;
  bool simulateTimeout = false;
  bool simulateValidationError = false;
  bool offlineMode = false;

  Future<void> init() async {
    if (_initialized) return;

    final jsonString = await rootBundle.loadString(_assetPath);
    final data = json.decode(jsonString) as Map<String, dynamic>;

    organizations = (data['organizations'] as List)
        .map((e) => Organization.fromJson(e))
        .toList();
    users = (data['users'] as List).map((e) => User.fromJson(e)).toList();
    orgMembers = (data['org_members'] as List)
        .map((e) => OrgMember.fromJson(e))
        .toList();
    projects = (data['projects'] as List)
        .map((e) => Project.fromJson(e))
        .toList();
    tasks = (data['tasks'] as List).map((e) => Task.fromJson(e)).toList();
    comments = (data['comments'] as List)
        .map((e) => Comment.fromJson(e))
        .toList();
    notifications = (data['notifications'] as List)
        .map((e) => Notification.fromJson(e))
        .toList();
    authMock = AuthMockData.fromJson(data['auth_mock']);

    _initialized = true;
  }

  // ---------------------------------------------------------------------------
  // Network simulation
  // ---------------------------------------------------------------------------
  Future<void> _simulateNetwork() async {
    if (offlineMode) {
      throw Exception('Network is offline');
    }

    // Simulate realistic network latency
    await Future.delayed(const Duration(milliseconds: 500));

    if (simulateTimeout) {
      throw Exception('Connection timeout');
    }
  }

  // ---------------------------------------------------------------------------
  // Auth
  // ---------------------------------------------------------------------------
  Future<LoginResponse> login(LoginRequest request) async {
    await _simulateNetwork();

    if (simulateValidationError) {
      throw Exception('Validation Error: Invalid request format');
    }

    // Match against test_credentials from auth_mock
    for (final cred in authMock!.testCredentials) {
      if (cred.email == request.email && cred.password == request.password) {
        final user = users.firstWhere((u) => u.email == cred.email);
        return LoginResponse(
          accessToken: authMock!.mockLoginResponse.accessToken,
          refreshToken: authMock!.mockLoginResponse.refreshToken,
          accessTokenExpiresInSeconds:
              authMock!.mockLoginResponse.accessTokenExpiresInSeconds,
          refreshTokenExpiresInSeconds:
              authMock!.mockLoginResponse.refreshTokenExpiresInSeconds,
          user: user,
          orgId: cred.orgId,
          role: cred.role,
        );
      }
    }
    throw Exception('Invalid credentials');
  }

  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async {
    await _simulateNetwork();

    // Simulate: if the provided refresh token matches, issue a new access token
    if (request.refreshToken == authMock!.mockLoginResponse.refreshToken) {
      return RefreshTokenResponse(
        accessToken:
            'mock.access.token.refreshed.${DateTime.now().millisecondsSinceEpoch}',
        refreshToken: authMock!.mockLoginResponse.refreshToken,
        accessTokenExpiresInSeconds:
            authMock!.mockLoginResponse.accessTokenExpiresInSeconds,
      );
    }
    throw Exception('Invalid refresh token');
  }

  Future<void> register(String name, String email, String password) async {
    await _simulateNetwork();
    if (simulateValidationError && (email.isEmpty || password.isEmpty)) {
      throw Exception('Validation Error: Email and password required');
    }

    if (users.any((u) => u.email == email)) {
      throw Exception('User already exists');
    }

    final newUser = User(
      id: 'user_${users.length + 100}',
      email: email,
      name: name,
      avatarUrl: 'https://i.pravatar.cc/150?u=$email',
    );
    users.add(newUser);

    // Add to test credentials so they can login
    authMock!.testCredentials.add(
      TestCredential(
        email: email,
        password: password,
        role: 'member',
        orgId: 'org_1',
      ),
    );

    // Add them as an org member to org_1
    orgMembers.add(
      OrgMember(
        id: 'org_member_${orgMembers.length + 100}',
        orgId: 'org_1',
        userId: newUser.id,
        role: 'member',
        joinedAt: DateTime.now(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Projects
  // ---------------------------------------------------------------------------
  Future<ProjectListResponse> getProjects(String orgId) async {
    await _simulateNetwork();
    final orgProjects = projects.where((p) => p.orgId == orgId).toList();
    return ProjectListResponse(
      projects: orgProjects,
      totalCount: orgProjects.length,
    );
  }

  Future<Project> getProject(String id) async {
    await _simulateNetwork();
    final p = projects.where((p) => p.id == id).firstOrNull;
    if (p == null || simulate404) throw Exception('Project not found');
    return p;
  }

  Future<Project> createProject(CreateProjectRequest request) async {
    await _simulateNetwork();
    if (simulateValidationError && request.name.isEmpty) {
      throw Exception('Validation Error: Project name is required');
    }
    final newProject = Project(
      id: 'proj_${projects.length + 100}',
      orgId: request.orgId,
      name: request.name,
      description: request.description,
      taskCount: 0,
      status: request.status,
      createdAt: DateTime.now(),
    );
    projects.add(newProject);
    return newProject;
  }

  Future<Project> updateProject(UpdateProjectRequest request) async {
    await _simulateNetwork();
    final index = projects.indexWhere((p) => p.id == request.id);
    if (index == -1 || simulate404) throw Exception('Project not found');

    final existing = projects[index];
    projects[index] = existing.copyWith(
      name: request.name ?? existing.name,
      description: request.description ?? existing.description,
      status: request.status ?? existing.status,
    );
    return projects[index];
  }

  Future<void> deleteProject(String id) async {
    await _simulateNetwork();
    if (simulate404 && !projects.any((p) => p.id == id)) {
      throw Exception('Project not found');
    }
    projects.removeWhere((p) => p.id == id);
  }

  // ---------------------------------------------------------------------------
  // Tasks
  // ---------------------------------------------------------------------------
  Future<TaskListResponse> getTasks(String orgId, {String? projectId}) async {
    await _simulateNetwork();
    final orgProjects = projects
        .where((p) => p.orgId == orgId)
        .map((p) => p.id)
        .toSet();
    final filteredTasks = tasks.where((t) {
      if (projectId != null && t.projectId != projectId) return false;
      return orgProjects.contains(t.projectId);
    }).toList();
    return TaskListResponse(
      tasks: filteredTasks,
      totalCount: filteredTasks.length,
    );
  }

  Future<Task> getTask(String id) async {
    await _simulateNetwork();
    final t = tasks.where((t) => t.id == id).firstOrNull;
    if (t == null || simulate404) throw Exception('Task not found');
    return t;
  }

  Future<Task> createTask(CreateTaskRequest request) async {
    await _simulateNetwork();
    if (simulateValidationError && request.title.isEmpty) {
      throw Exception('Validation Error: Task title is required');
    }
    final newTask = Task(
      id: 'task_${tasks.length + 1000}',
      title: request.title,
      description: request.description,
      status: request.status,
      priority: request.priority,
      projectId: request.projectId,
      assigneeId: request.assigneeId,
      dueDate: request.dueDate ?? DateTime.now().toIso8601String(),
      createdAt: DateTime.now(),
    );
    tasks.insert(0, newTask);
    return newTask;
  }

  Future<Task> updateTask(UpdateTaskRequest request) async {
    await _simulateNetwork();
    final index = tasks.indexWhere((t) => t.id == request.id);
    if (index == -1 || simulate404) throw Exception('Task not found');

    final existing = tasks[index];
    tasks[index] = existing.copyWith(
      title: request.title ?? existing.title,
      description: request.description ?? existing.description,
      status: request.status ?? existing.status,
      priority: request.priority ?? existing.priority,
      assigneeId: request.assigneeId ?? existing.assigneeId,
      dueDate: request.dueDate ?? existing.dueDate,
    );
    return tasks[index];
  }

  Future<void> deleteTask(String id) async {
    await _simulateNetwork();
    if (simulate404 && !tasks.any((t) => t.id == id)) {
      throw Exception('Task not found');
    }
    tasks.removeWhere((t) => t.id == id);
  }

  // ---------------------------------------------------------------------------
  // Comments
  // ---------------------------------------------------------------------------
  Future<List<Comment>> getComments(String taskId) async {
    await _simulateNetwork();
    return comments.where((c) => c.taskId == taskId).toList();
  }

  Future<Comment> createComment(CreateCommentRequest request) async {
    await _simulateNetwork();
    final newComment = Comment(
      id: 'comment_${comments.length + 500}',
      taskId: request.taskId,
      authorId: request.authorId,
      body: request.body,
      createdAt: DateTime.now(),
    );
    comments.add(newComment);
    return newComment;
  }

  // ---------------------------------------------------------------------------
  // Notifications
  // ---------------------------------------------------------------------------
  Future<NotificationListResponse> getNotifications(String userId) async {
    await _simulateNetwork();
    final userNotifications = notifications
        .where((n) => n.userId == userId)
        .toList();
    return NotificationListResponse(
      notifications: userNotifications,
      unreadCount: userNotifications.where((n) => !n.read).length,
    );
  }

  Future<void> markNotificationRead(String id) async {
    await _simulateNetwork();
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(read: true);
    }
  }

  // ---------------------------------------------------------------------------
  // Users & Members
  // ---------------------------------------------------------------------------
  Future<User?> getUser(String id) async {
    return users.where((u) => u.id == id).firstOrNull;
  }

  Future<UserListResponse> getOrgMembers(String orgId) async {
    await _simulateNetwork();
    final memberIds = orgMembers
        .where((m) => m.orgId == orgId)
        .map((m) => m.userId)
        .toSet();
    final orgUsers = users.where((u) => memberIds.contains(u.id)).toList();
    return UserListResponse(users: orgUsers, totalCount: orgUsers.length);
  }

  Future<OrgMember?> getOrgMember(String orgId, String userId) async {
    return orgMembers
        .where((m) => m.orgId == orgId && m.userId == userId)
        .firstOrNull;
  }
}
