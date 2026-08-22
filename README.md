# TaskFlow

TaskFlow is a lightweight, responsive project and task management mobile application built with Flutter. It was developed to demonstrate clean architecture, robust state management, and separation of concerns using a simulated mock data layer.

## Overview
This application allows users belonging to an organization to:
- Manage Projects (Create, Read, Update, Delete)
- Manage Tasks (Create, Read, Update, Delete, Assign)
- View and filter tasks by status and priority
- Simulate real-world interactions such as Authentication (JWT mocking) and Network Connectivity States (Offline Mode, Server Errors).

## Architecture & State Management
TaskFlow follows a **Clean/Layered Architecture**:
1. **Presentation Layer**: UI components, Screens, and Riverpod Providers handling state.
2. **Domain Layer**: Abstract Repositories defining the contract for data operations.
3. **Data Layer**: Concrete Repository implementations, JSON serialization, and the `MockDataSource` which acts as the simulated network boundary.

**State Management**: `flutter_riverpod` is used for reactive state management. Data is fetched asynchronously via `FutureProvider` and mutations are handled using `AsyncNotifierProvider`, ensuring a consistent `Initial -> Loading -> Success/Error` state flow throughout the application without relying on excessive `setState`.

## Security & Local Storage
- **Authentication**: Simulated JWT-style auth. Passwords are not logged or stored.
- **Token Storage**: `flutter_secure_storage` is used to securely encrypt and persist the mock access and refresh tokens.
- **Session Metadata**: `shared_preferences` is used for non-sensitive session data like the user's role and organization ID.

## Setup & Running the App

### Requirements
- Flutter SDK (latest stable)
- Dart SDK

### Installation
1. Clone the repository
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application (Debug mode):
   ```bash
   flutter run
   ```
4. Build the Release APK:
   ```bash
   flutter build apk --release
   ```

## Test Credentials
To test the application, use the following mocked credentials defined in `assets/mock_data/TaskFlow-MockData.json`:

**Org A (Nimbus Digital)**
- Admin: `ava.admin@nimbusdigital.test` / `Password123!`
- Member: `marcus.member@nimbusdigital.test` / `Password123!`

**Org B (Harborlight Studios)**
- Admin: `daniel.admin@harborlightstudios.test` / `Password123!`
- Member: `elena.member@harborlightstudios.test` / `Password123!`

## Simulated Errors & Offline State
To evaluate how the app handles network failures and edge cases, a hidden **Debug Settings** screen has been provided. 
1. Log in to the application.
2. Tap the **Bug Icon** located in the top right corner of the `CustomAppBar`.
3. Toggle the following simulations:
   - **Offline Mode**: Simulates loss of connectivity (`NoInternetException`).
   - **Simulate 404**: Forces lookup operations to fail gracefully.
   - **Simulate Timeout**: Forces long-running network operations to timeout.

## Testing
The project includes Unit, Widget, and Integration tests. Run the test suite via:
```bash
flutter test
```
*Integration tests can be found in the `integration_test/` directory.*

## Known Limitations & Trade-offs
- The data is stored strictly in-memory during the session. A hard app kill will reset mutations since there is no persistent local SQLite/Hive database implemented for full offline-syncing, which was outside the scope of this assignment.
- The `flutter_secure_storage` implementation is synchronous on the interface level in the mock, but securely persists asynchronous writes under the hood.
- Biometric unlock and dynamic push notifications were not fully integrated with real native APIs due to the mocked nature of the backend.
