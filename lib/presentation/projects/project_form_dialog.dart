import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/models/project_model.dart';
import 'package:taskflow/presentation/projects/project_providers.dart';
import 'package:taskflow/presentation/widgets/custom_button.dart';
import 'package:taskflow/presentation/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';
import 'package:taskflow/core/utils/toast_service.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';

class ProjectFormDialog extends ConsumerStatefulWidget {
  final Project? projectToEdit;

  const ProjectFormDialog({super.key, this.projectToEdit});

  @override
  ConsumerState<ProjectFormDialog> createState() => _ProjectFormDialogState();
}

class _ProjectFormDialogState extends ConsumerState<ProjectFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  String _status = 'active';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.projectToEdit?.name ?? '');
    _descController = TextEditingController(text: widget.projectToEdit?.description ?? '');
    _status = widget.projectToEdit?.status ?? 'active';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(projectNotifierProvider.notifier);
      final orgId = ref.read(currentOrgIdProvider);

      if (orgId == null) return;
      
      if (widget.projectToEdit == null) {
        final newProject = Project(
          id: const Uuid().v4(),
          orgId: orgId,
          name: _nameController.text.trim(),
          description: _descController.text.trim(),
          status: _status,
          taskCount: 0,
          createdAt: DateTime.now(),
        );
        await notifier.createProject(newProject);
      } else {
        final updatedProject = widget.projectToEdit!.copyWith(
          name: _nameController.text.trim(),
          description: _descController.text.trim(),
          status: _status,
        );
        await notifier.updateProject(updatedProject);
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
                widget.projectToEdit == null ? 'Create Project' : 'Edit Project',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _nameController,
                labelText: 'Project Name',
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
                  DropdownMenuItem(value: 'active', child: Text('Active')),
                  DropdownMenuItem(value: 'archived', child: Text('Archived')),
                ],
                onChanged: (val) => setState(() => _status = val!),
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
