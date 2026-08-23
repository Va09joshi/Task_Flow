class TaskStatus {
  static const String todo = 'todo';
  static const String inProgress = 'in_progress';
  static const String review = 'review';
  static const String done = 'done';

  static const List<String> values = [todo, inProgress, review, done];
}

class TaskPriority {
  static const String low = 'low';
  static const String medium = 'medium';
  static const String high = 'high';
  static const String urgent = 'urgent';

  static const List<String> values = [low, medium, high, urgent];
}
