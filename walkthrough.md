# TaskFlow Implementation Walkthrough

The TaskFlow application is now fully implemented according to the assignment requirements, providing a robust architecture to manage projects and tasks offline.

## What Was Built

### 1. Mock Data Integration
- **Local Data Source**: The `TaskFlow-MockData.json` is used as a simulated local database via `MockDataSource`. 
- **Decoupled Architecture**: The UI never directly reads the JSON file. It interacts exclusively with Domain Repositories (`AuthRepository`, `ProjectRepository`, `TaskRepository`, `UserRepository`).

### 2. Authentication & Security
- **Secure Token Storage**: Leverages `flutter_secure_storage` to save access and refresh tokens.
- **Session Management**: `AuthNotifier` reads tokens on app start (`SplashScreen`) and automatically routes the user to `/home` or `/login`.
- **Role-based Authorization**: Handled via `isAdminProvider` directly in the Riverpod layer to restrict project deletion and creation forms to `org_admin`.

### 3. Application State & UI
- **Riverpod State Management**: Implemented `StateNotifierProvider` for global auth logic and `FutureProvider` for asynchronous fetching of projects and tasks. 
- **GoRouter Navigation**: Declarative and secure routing redirect logic ensuring unauthorized users cannot access internal screens.
- **Project & Task Modules**: Created modular screens (`ProjectListScreen`, `ProjectDetailsScreen`, `TaskListScreen`, `TaskDetailsScreen`, `TaskFormScreen`) that use caching logic.

### 4. Reliability & Error Handling
- **Debug Configuration**: Created a global `debug_config.dart` containing providers that simulate API failures (e.g., 404, Timeouts) and toggle Offline Mode.
- **Offline Caching**: Replaced network calls with `SharedPreferences` cache fallbacks within the Repositories, so users can read previously fetched projects/tasks even when offline mode is toggled.

## Architecture Highlights
> [!TIP]
> The app employs strict **Clean Architecture** constraints. Repositories depend on `MockDataSource`, while Providers inject Repositories into the Notifiers, making the entire stack highly testable and decoupled from standard network boundaries.

## Testing & Verification
- Comprehensive **unit tests** were written for `AuthNotifier` and `TaskNotifier` (`auth_test.dart`, `task_test.dart`) to validate the role-based logic.
- App routes were verified to enforce session existence before accessing `/home`.

> [!WARNING]
> To run the app, make sure to execute `flutter pub run build_runner build` successfully in your environment to clear any cached code generation artifacts that may interfere with Dart 3's new pattern matching.
