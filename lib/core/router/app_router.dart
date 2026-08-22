import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/presentation/auth/splash/splash_screen.dart';
import 'package:taskflow/presentation/auth/login/login_screen.dart';
import 'package:taskflow/presentation/auth/register/register_screen.dart';
import 'package:taskflow/presentation/home/home_screen.dart';
import 'package:taskflow/presentation/debug/debug_settings_screen.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/presentation/auth/auth_state.dart';

import 'package:taskflow/presentation/projects/project_list_screen.dart';
import 'package:taskflow/presentation/projects/project_details_screen.dart';
import 'package:taskflow/presentation/tasks/task_list_screen.dart';
import 'package:taskflow/presentation/tasks/task_details_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final isAuth = switch (authState) {
        AuthStateAuthenticated() => true,
        _ => false,
      };
      
      final isSplash = state.uri.path == '/splash';
      final isLogin = state.uri.path == '/login';
      final isRegister = state.uri.path == '/register';

      if (isSplash) return null; // Let splash decide
      
      if (!isAuth && !isLogin && !isRegister) {
        return '/login';
      }

      if (isAuth && (isLogin || isRegister)) {
        return '/home'; // or /projects
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ProjectListScreen(),
      ),
      GoRoute(
        path: '/projects/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProjectDetailsScreen(projectId: id);
        },
      ),
      GoRoute(
        path: '/tasks',
        builder: (context, state) => const TaskListScreen(),
      ),
      GoRoute(
        path: '/tasks/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return TaskDetailsScreen(taskId: id);
        },
      ),
    ],
  );
});
