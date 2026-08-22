import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/tasks/task_list_state.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/presentation/projects/project_providers.dart';
import 'package:taskflow/presentation/tasks/task_form_dialog.dart';
import 'package:taskflow/presentation/widgets/custom_card.dart';
import 'package:taskflow/presentation/widgets/custom_app_bar.dart';
import 'package:taskflow/presentation/widgets/custom_button.dart';
import 'package:taskflow/presentation/widgets/task_card.dart';
import 'package:taskflow/presentation/widgets/list_shimmer.dart';
import 'package:taskflow/core/constants/task_constants.dart';

import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/presentation/tasks/task_filter_bottom_sheet.dart';

final taskFilterStatusProvider = StateProvider<String?>((ref) => null);
final taskFilterPriorityProvider = StateProvider<String?>((ref) => null);
final taskFilterAssigneeProvider = StateProvider<String?>((ref) => null);
final taskFilterDueDateRangeProvider = StateProvider<DateTimeRange?>((ref) => null);

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListState = ref.watch(taskListNotifierProvider);
    final filterStatus = ref.watch(taskFilterStatusProvider);
    final filterPriority = ref.watch(taskFilterPriorityProvider);

    final filterAssignee = ref.watch(taskFilterAssigneeProvider);
    final filterDueDateRange = ref.watch(taskFilterDueDateRangeProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tasks',
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                backgroundColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20))),
                builder: (_) => const TaskFilterBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: taskListState.when(
              initial: () => const ListShimmer(),
              loading: () => const ListShimmer(),
              success: (allTasks) {
                final tasks = allTasks.where((t) {
                  if (filterStatus != null && t.status != filterStatus)
                    return false;
                  if (filterPriority != null && t.priority != filterPriority)
                    return false;
                  if (filterAssignee != null && t.assigneeId != filterAssignee)
                    return false;
                  if (filterDueDateRange != null && t.dueDate != null) {
                    final due = DateTime.parse(t.dueDate!);
                    // Start of start date, end of end date for inclusive filtering
                    final start = DateTime(filterDueDateRange.start.year,
                        filterDueDateRange.start.month, filterDueDateRange.start
                            .day);
                    final end = DateTime(filterDueDateRange.end.year,
                        filterDueDateRange.end.month, filterDueDateRange.end
                            .day, 23, 59, 59);
                    if (due.isBefore(start) || due.isAfter(end)) return false;
                  }
                  return true;
                }).toList();

                if (tasks.isEmpty) {
                  return const Center(
                    child: Text('No tasks found for this status.'),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.read(taskListNotifierProvider.notifier).fetchTasks(),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskListItem(task: task);
                    },
                  ),
                );
              },
              empty: () => const Center(
                child: Text('No tasks found. Create a task to get started!'),
              ),
              error: (err) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final projects = await ref.read(projectsProvider.future);
          if (projects.isEmpty) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please create a project first!')),
              );
            }
            return;
          }
          if (context.mounted) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              backgroundColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20))),
              builder: (_) => TaskFormDialog(projectId: projects.first.id),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );

  }
}

class TaskListItem extends ConsumerWidget {
  final Task task;

  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TaskCard(
      task: task,
      onTap: () => context.push('/tasks/${task.id}'),
    );
  }
}
