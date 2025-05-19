import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/domain/models/task_status.dart';

class Task {
  Task({
    this.id,
    required this.time,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.priority,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });


  final String? id;

  final DateTime time;

  final String title;

  final String description;

  final DateTime startTime;

  final DateTime endTime;

  final TaskPriority priority;

  final TaskStatus status;

  final DateTime createdAt;

  final DateTime? updatedAt;
}
