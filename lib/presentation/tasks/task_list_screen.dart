import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/presentation/projects/project_providers.dart';
import 'package:taskflow/presentation/tasks/task_form_dialog.dart';
import 'package:taskflow/presentation/widgets/custom_card.dart';
import 'package:taskflow/presentation/widgets/custom_app_bar.dart';
import 'package:taskflow/presentation/widgets/custom_button.dart';
import 'package:taskflow/presentation/widgets/list_shimmer.dart';
import 'package:taskflow/core/constants/task_constants.dart';

import 'package:taskflow/data/models/task_model.dart';

final taskFilterStatusProvider = StateProvider<String?>((ref) => null);
final taskFilterPriorityProvider = StateProvider<String?>((ref) => null);

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksProvider);
    final filterStatus = ref.watch(taskFilterStatusProvider);
    final filterPriority = ref.watch(taskFilterPriorityProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tasks',
      ),
      body: Column(
        children: [
          _buildFilterBar(context, ref, filterStatus),
          Expanded(
            child: tasksAsync.when(
              data: (allTasks) {
                final tasks = allTasks.where((t) {
                  if (filterStatus != null && t.status != filterStatus) return false;
                  return true;
                }).toList();

                if (tasks.isEmpty) {
                  return const Center(
                    child: Text('No tasks found for this status.'),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.refresh(tasksProvider.future),
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
              loading: () => const ListShimmer(),
              error: (err, stack) => Center(child: Text('Error: $err')),
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
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              builder: (_) => TaskFormDialog(projectId: projects.first.id),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context, WidgetRef ref, String? currentStatus) {
    final filters = [
      {'label': 'All', 'value': null},
      {'label': 'To Do', 'value': TaskStatus.todo},
      {'label': 'In Progress', 'value': TaskStatus.inProgress},
      {'label': 'Review', 'value': TaskStatus.review},
      {'label': 'Done', 'value': TaskStatus.done},
    ];

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = currentStatus == filter['value'];
          
          return ChoiceChip(
            label: Text(filter['label'] as String),
            selected: isSelected,
            selectedColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
            labelStyle: TextStyle(
              color: isSelected 
                  ? Theme.of(context).colorScheme.primary 
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            side: BorderSide(
              color: isSelected 
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.5) 
                  : Theme.of(context).dividerColor,
            ),
            onSelected: (_) {
              ref.read(taskFilterStatusProvider.notifier).state = filter['value'] as String?;
            },
          );
        },
      ),
    );
  }
}

class TaskListItem extends ConsumerWidget {
  final Task task;

  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userAsync = task.assigneeId != null 
        ? ref.watch(userProvider(task.assigneeId!)) 
        : const AsyncValue.data(null);

    return InkWell(
      onTap: () => context.push('/tasks/${task.id}'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor.withValues(alpha: 0.1),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userAsync.when(
              data: (user) {
                if (user != null && user.avatarUrl.isNotEmpty) {
                  return CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(user.avatarUrl),
                    backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                  );
                }
                return CircleAvatar(
                  radius: 22,
                  backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                  child: Icon(Icons.person_outline, color: theme.colorScheme.primary),
                );
              },
              loading: () => const CircleAvatar(radius: 22, child: CircularProgressIndicator(strokeWidth: 2)),
              error: (_, __) => CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red.withValues(alpha: 0.1),
                child: const Icon(Icons.error_outline, color: Colors.red),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (task.description.isNotEmpty) ...[
                    Text(
                      task.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  Text.rich(
                    TextSpan(
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(text: '${_getUserName(userAsync)} • '),
                        TextSpan(
                          text: _formatString(task.status),
                          style: TextStyle(
                            color: _getStatusColor(task.status),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(text: ' • ${_formatString(task.priority)}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case TaskStatus.done:
        return Colors.green;
      case TaskStatus.inProgress:
        return Colors.blue;
      case TaskStatus.review:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getUserName(AsyncValue<dynamic> userAsync) {
    return userAsync.when(
      data: (user) => user?.name ?? 'Unassigned',
      loading: () => 'Loading...',
      error: (_, __) => 'Unknown',
    );
  }

  String _formatString(String value) {
    if (value.isEmpty) return value;
    return value.split('_').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
