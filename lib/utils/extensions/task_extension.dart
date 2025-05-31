import 'package:myapp/domain/models/task.dart';
import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/domain/models/task_status.dart';

extension TaskExtension on Task {
  Task copyWith({
    String? title,
    String? description,
    DateTime? time,
    DateTime? startTime,
    DateTime? endTime,
    TaskPriority? priority,
    TaskStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

}