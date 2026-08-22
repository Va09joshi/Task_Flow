import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/domain/repositories/task_repository.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskRepository {
  @override
  Future<void> createTask(Task task) => super.noSuchMethod(
        Invocation.method(#createTask, [task]),
        returnValue: Future.value(),
        returnValueForMissingStub: Future.value(),
      );
}

void main() {
  test('createTask sets error state on repository failure', () async {
    final mockRepo = MockTaskRepository();
    
    final container = ProviderContainer(
      overrides: [
        taskRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );

    final notifier = container.read(taskNotifierProvider.notifier);
    
    // Attempt to create
    final dummyTask = Task(
      id: '1', projectId: 'p1', title: 't', description: 'd',
      status: 'todo', priority: 'low', dueDate: '2026', createdAt: DateTime.now()
    );

    when(mockRepo.createTask(dummyTask)).thenThrow(Exception('Simulated failure'));

    await notifier.createTask(dummyTask);

    final state = container.read(taskNotifierProvider);
    expect(state is AsyncError, true);
  });
}
