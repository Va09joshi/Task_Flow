import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/presentation/widgets/custom_text_field.dart';
import 'package:taskflow/presentation/widgets/custom_button.dart';
import 'package:taskflow/presentation/widgets/custom_app_bar.dart';
import 'package:uuid/uuid.dart';

class TaskFormScreen extends ConsumerStatefulWidget {
  final Task? task;
  final String? initialProjectId;

  const TaskFormScreen({super.key, this.task, this.initialProjectId});

  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  String? _selectedProjectId;
  String? _selectedAssigneeId;
  String _status = 'todo';
  String _priority = 'medium';
  DateTime _dueDate = DateTime.now().add(const Duration(days: 7));

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descController = TextEditingController(text: widget.task?.description ?? '');
    _selectedProjectId = widget.task?.projectId ?? widget.initialProjectId;
    _selectedAssigneeId = widget.task?.assigneeId;
    if (widget.task != null) {
      _status = widget.task!.status;
      _priority = widget.task!.priority;
      _dueDate = DateTime.parse(widget.task!.dueDate);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _saveTask() async {
    if (_formKey.currentState!.validate() && _selectedProjectId != null) {
      final task = Task(
        id: widget.task?.id ?? const Uuid().v4(),
        projectId: _selectedProjectId!,
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        status: _status,
        priority: _priority,
        assigneeId: _selectedAssigneeId,
        dueDate: _dueDate.toIso8601String().split('T')[0],
        createdAt: widget.task?.createdAt ?? DateTime.now(),
      );

      if (widget.task == null) {
        await ref.read(taskNotifierProvider.notifier).createTask(task);
      } else {
        await ref.read(taskNotifierProvider.notifier).updateTask(task);
      }

      if (mounted) Navigator.pop(context);
    } else if (_selectedProjectId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a project')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // In a real app we'd use providers to fetch org members and projects for dropdowns
    // Here we'll just mock it or assume it's passed. I will use the userRepositoryProvider 
    // to get members. We need a provider for members.
    
    return Scaffold(
      appBar: CustomAppBar(title: widget.task == null ? 'Create Task' : 'Edit Task'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Save',
                onPressed: _saveTask,
              )
            ],
          ),
        ),
      ),
    );
  }
}
