import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/core/constants/task_constants.dart';
import 'package:taskflow/data/models/user_model.dart';

class TaskCard extends ConsumerWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userAsync = task.assigneeId != null 
        ? ref.watch(userProvider(task.assigneeId!)) 
        : const AsyncValue<User?>.data(null);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  _buildStatusBadge(theme, task.status),
                ],
              ),
              if (task.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  task.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildAssigneeAvatar(theme, userAsync),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getUserName(userAsync),
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (task.dueDate.isNotEmpty)
                          Text(
                            'Due: ${_formatDate(task.dueDate)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                      ],
                    ),
                  ),
                  _buildPriorityIndicator(theme, task.priority),
                ],
              ),
            ],
          ),
        ),
      ),
      )
    );
  }

  Widget _buildStatusBadge(ThemeData theme, String status) {
    Color color;
    switch (status) {
      case TaskStatus.done:
        color = Colors.green;
        break;
      case TaskStatus.inProgress:
        color = Colors.blue;
        break;
      case TaskStatus.review:
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        _formatString(status),
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPriorityIndicator(ThemeData theme, String priority) {
    IconData icon;
    Color color;

    switch (priority) {
      case TaskPriority.urgent:
        icon = Icons.warning_rounded;
        color = Colors.red;
        break;
      case TaskPriority.high:
        icon = Icons.arrow_upward_rounded;
        color = Colors.orange;
        break;
      case TaskPriority.low:
        icon = Icons.arrow_downward_rounded;
        color = Colors.blue;
        break;
      default:
        icon = Icons.remove_rounded;
        color = Colors.grey;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          _formatString(priority),
          style: theme.textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildAssigneeAvatar(ThemeData theme, AsyncValue<User?> userAsync) {
    return userAsync.when(
      data: (user) {
        if (user != null && user.avatarUrl.isNotEmpty) {
          return CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(user.avatarUrl),
            backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
          );
        }
        return CircleAvatar(
          radius: 16,
          backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
          child: Icon(Icons.person_outline, size: 18, color: theme.colorScheme.primary),
        );
      },
      loading: () => const SizedBox(
        width: 32,
        height: 32,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (_, __) => CircleAvatar(
        radius: 16,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        child: const Icon(Icons.error_outline, size: 18, color: Colors.red),
      ),
    );
  }

  String _getUserName(AsyncValue<User?> userAsync) {
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

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString).toLocal();
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return dateString;
    }
  }
}
