import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/core/widgets/custom_button.dart';
import 'package:taskflow/core/widgets/custom_app_bar.dart';
import 'package:taskflow/presentation/tasks/task_form_dialog.dart';
import 'package:taskflow/core/widgets/detail_shimmer.dart';

import '../widgets/custom_card.dart';

class TaskDetailsScreen extends ConsumerWidget {
  final String taskId;

  const TaskDetailsScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the specific task using taskProvider
    final taskAsync = ref.watch(taskProvider(taskId));

    return Scaffold(
      appBar: const CustomAppBar(title: 'Task Details'),
      body: taskAsync.when(
        data: (task) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  task.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  task.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 32),
                CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Status', task.status),
                      const Divider(height: 24),
                      _buildDetailRow('Priority', task.priority),
                      const Divider(height: 24),
                      _buildAssigneeRow(ref, task.assigneeId),
                      const Divider(height: 24),
                      _buildDetailRow('Due Date', task.dueDate),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'Edit',
                      isFullWidth: false,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => TaskFormDialog(
                            taskToEdit: task,
                            projectId: task.projectId,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    CustomButton(
                      text: 'Delete',
                      isFullWidth: false,
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Delete Task'),
                            content: const Text(
                              'Are you sure you want to delete this task?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx); // Close dialog
                                  ref
                                      .read(taskNotifierProvider.notifier)
                                      .deleteTask(taskId);
                                  Navigator.pop(context); // Go back to list
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => const DetailShimmer(),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildAssigneeRow(WidgetRef ref, String? assigneeId) {
    if (assigneeId == null) {
      return _buildDetailRow('Assignee', 'Unassigned');
    }

    final userAsync = ref.watch(userProvider(assigneeId));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Assignee',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          userAsync.when(
            data: (user) {
              if (user == null) return const Text('Unknown User');
              return Row(
                children: [
                  if (user.avatarUrl.isNotEmpty) ...[
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              );
            },
            loading: () => const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            error: (_, __) => const Text('Error loading user'),
          ),
        ],
      ),
    );
  }
}
