import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/constants/task_constants.dart';
import 'package:taskflow/presentation/tasks/task_list_screen.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/core/widgets/custom_button.dart';

class TaskFilterBottomSheet extends ConsumerWidget {
  const TaskFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterStatus = ref.watch(taskFilterStatusProvider);
    final filterPriority = ref.watch(taskFilterPriorityProvider);
    final filterAssignee = ref.watch(taskFilterAssigneeProvider);
    final filterDueDateRange = ref.watch(taskFilterDueDateRangeProvider);
    final membersAsync = ref.watch(orgMembersProvider);

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter Tasks',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              _buildChoiceChip(
                context,
                ref,
                'All',
                null,
                filterStatus,
                taskFilterStatusProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'To Do',
                TaskStatus.todo,
                filterStatus,
                taskFilterStatusProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'In Progress',
                TaskStatus.inProgress,
                filterStatus,
                taskFilterStatusProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'Review',
                TaskStatus.review,
                filterStatus,
                taskFilterStatusProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'Done',
                TaskStatus.done,
                filterStatus,
                taskFilterStatusProvider,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Priority', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              _buildChoiceChip(
                context,
                ref,
                'All',
                null,
                filterPriority,
                taskFilterPriorityProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'Low',
                TaskPriority.low,
                filterPriority,
                taskFilterPriorityProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'Medium',
                TaskPriority.medium,
                filterPriority,
                taskFilterPriorityProvider,
              ),
              _buildChoiceChip(
                context,
                ref,
                'High',
                TaskPriority.high,
                filterPriority,
                taskFilterPriorityProvider,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Assignee', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          membersAsync.when(
            data: (members) => DropdownButtonFormField<String?>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: filterAssignee,
              items: [
                const DropdownMenuItem(value: null, child: Text('All')),
                ...members.map(
                  (m) => DropdownMenuItem(value: m.id, child: Text(m.name)),
                ),
              ],
              onChanged: (val) =>
                  ref.read(taskFilterAssigneeProvider.notifier).state = val,
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => const Text('Error loading members'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Due Date Range',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.date_range),
            label: Text(
              filterDueDateRange != null
                  ? '${filterDueDateRange.start.toString().split(' ')[0]} - ${filterDueDateRange.end.toString().split(' ')[0]}'
                  : 'Select Range',
            ),
            onPressed: () async {
              final range = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                initialDateRange: filterDueDateRange,
              );
              if (range != null) {
                ref.read(taskFilterDueDateRangeProvider.notifier).state = range;
              }
            },
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(taskFilterStatusProvider.notifier).state = null;
                    ref.read(taskFilterPriorityProvider.notifier).state = null;
                    ref.read(taskFilterAssigneeProvider.notifier).state = null;
                    ref.read(taskFilterDueDateRangeProvider.notifier).state =
                        null;
                  },
                  child: const Text('Clear'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: 'Apply',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(
    BuildContext context,
    WidgetRef ref,
    String label,
    String? value,
    String? groupValue,
    StateProvider<String?> provider,
  ) {
    final isSelected = groupValue == value;
    final theme = Theme.of(context);
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: theme.colorScheme.primary.withValues(alpha: 0.15),
      labelStyle: TextStyle(
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected
            ? theme.colorScheme.primary.withValues(alpha: 0.5)
            : theme.dividerColor,
      ),
      onSelected: (_) => ref.read(provider.notifier).state = value,
    );
  }
}
