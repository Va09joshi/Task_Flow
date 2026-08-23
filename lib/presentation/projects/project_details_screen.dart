import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/projects/project_form_dialog.dart';
import 'package:taskflow/presentation/projects/project_providers.dart';
import 'package:taskflow/presentation/tasks/task_providers.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/core/widgets/custom_card.dart';
import 'package:taskflow/core/widgets/custom_app_bar.dart';
import 'package:taskflow/presentation/tasks/task_form_dialog.dart';
import 'package:taskflow/core/widgets/custom_button.dart';
import 'package:taskflow/core/widgets/list_shimmer.dart';
import 'package:taskflow/presentation/tasks/task_list_screen.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  final String projectId;

  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ideally we fetch the specific project, or we just get it from the list
    final projectsAsync = ref.watch(projectsProvider);
    final tasksAsync = ref.watch(tasksByProjectProvider(projectId));

    return Scaffold(
      appBar: const CustomAppBar(title: 'Project Details'),
      body: projectsAsync.when(
        data: (projects) {
          final project = projects.where((p) => p.id == projectId).firstOrNull;
          if (project == null) {
            return const Center(child: Text('Project not found'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        project.name,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        project.description,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(height: 1.5),
                      ),
                      const SizedBox(height: 24),
                      // Admin Actions for Project
                      if (ref.watch(isAdminProvider))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              text: 'Edit Project',
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
                                  builder: (_) =>
                                      ProjectFormDialog(projectToEdit: project),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            CustomButton(
                              text: 'Delete Project',
                              isFullWidth: false,
                              backgroundColor: Colors.redAccent,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Delete Project'),
                                    content: const Text(
                                      'Are you sure you want to delete this project?',
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
                                              .read(
                                                projectNotifierProvider
                                                    .notifier,
                                              )
                                              .deleteProject(projectId);
                                          Navigator.pop(
                                            context,
                                          ); // Go back to list
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
                      const SizedBox(height: 16),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomButton(
                            text: '+ Add Task',
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
                                builder: (_) =>
                                    TaskFormDialog(projectId: projectId),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      tasksAsync.when(
                        data: (projectTasks) {
                          if (projectTasks.isEmpty)
                            return const Text('No tasks for this project.');

                          // Task Summary grouped by status
                          final todo = projectTasks
                              .where((t) => t.status == 'todo')
                              .length;
                          final inProgress = projectTasks
                              .where((t) => t.status == 'in_progress')
                              .length;
                          final review = projectTasks
                              .where((t) => t.status == 'review')
                              .length;
                          final done = projectTasks
                              .where((t) => t.status == 'done')
                              .length;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildSummaryCard('Todo', todo, Colors.grey),
                                  _buildSummaryCard(
                                    'In Progress',
                                    inProgress,
                                    Colors.blue,
                                  ),
                                  _buildSummaryCard(
                                    'Review',
                                    review,
                                    Colors.orange,
                                  ),
                                  _buildSummaryCard('Done', done, Colors.green),
                                ],
                              ),
                            ],
                          );
                        },
                        loading: () => const ListShimmer(itemCount: 1),
                        error: (e, _) => Text('Error loading task summary: $e'),
                      ),
                    ],
                  ),
                ),
                tasksAsync.when(
                  data: (projectTasks) {
                    if (projectTasks.isEmpty) return const SizedBox.shrink();
                    return Column(
                      children: projectTasks
                          .map((task) => TaskListItem(task: task))
                          .toList(),
                    );
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListShimmer(itemCount: 3),
                  ),
                  error: (e, _) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) => TaskFormDialog(projectId: projectId),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummaryCard(String title, int count, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CustomCard(
          color: color.withValues(alpha: 0.1),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
