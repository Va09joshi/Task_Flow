import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/core/utils/toast_service.dart';
import 'package:taskflow/presentation/widgets/custom_button.dart';
import 'package:taskflow/presentation/widgets/custom_text_field.dart';
import 'package:taskflow/core/constants/task_constants.dart';
import 'package:uuid/uuid.dart';

class TaskFormDialog extends ConsumerStatefulWidget {
  final Task? taskToEdit;
  final String projectId;

  const TaskFormDialog({super.key, this.taskToEdit, required this.projectId});

  @override
  ConsumerState<TaskFormDialog> createState() => _TaskFormDialogState();
}

class _TaskFormDialogState extends ConsumerState<TaskFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  String _status = TaskStatus.todo;
  String _priority = TaskPriority.medium;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.taskToEdit?.title ?? '');
    _descController = TextEditingController(text: widget.taskToEdit?.description ?? '');
    _status = widget.taskToEdit?.status ?? TaskStatus.todo;
    _priority = widget.taskToEdit?.priority ?? TaskPriority.medium;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(taskNotifierProvider.notifier);
      
      if (widget.taskToEdit == null) {
        final newTask = Task(
          id: const Uuid().v4(),
          projectId: widget.projectId,
          title: _titleController.text.trim(),
          description: _descController.text.trim(),
          status: _status,
          priority: _priority,
          dueDate: DateTime.now().add(const Duration(days: 7)).toIso8601String().split('T').first,
          createdAt: DateTime.now(),
        );
        await notifier.createTask(newTask);
      } else {
        final updatedTask = widget.taskToEdit!.copyWith(
          title: _titleController.text.trim(),
          description: _descController.text.trim(),
          status: _status,
          priority: _priority,
        );
        await notifier.updateTask(updatedTask);
      }

      if (mounted) Navigator.pop(context);
    } else {
      ToastService.showError(context, 'Please fill in all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.taskToEdit == null ? 'Create Task' : 'Edit Task',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _titleController,
                labelText: 'Title',
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _descController,
                labelText: 'Description',
                maxLines: 3,
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Status', filled: true),
                items: const [
                  DropdownMenuItem(value: TaskStatus.todo, child: Text('To Do')),
                  DropdownMenuItem(value: TaskStatus.inProgress, child: Text('In Progress')),
                  DropdownMenuItem(value: TaskStatus.review, child: Text('Review')),
                  DropdownMenuItem(value: TaskStatus.done, child: Text('Done')),
                ],
                onChanged: (val) => setState(() => _status = val!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _priority,
                decoration: const InputDecoration(labelText: 'Priority', filled: true),
                items: const [
                  DropdownMenuItem(value: TaskPriority.low, child: Text('Low')),
                  DropdownMenuItem(value: TaskPriority.medium, child: Text('Medium')),
                  DropdownMenuItem(value: TaskPriority.high, child: Text('High')),
                  DropdownMenuItem(value: TaskPriority.urgent, child: Text('Urgent')),
                ],
                onChanged: (val) => setState(() => _priority = val!),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context), 
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      text: 'Save',
                      onPressed: _submit,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
