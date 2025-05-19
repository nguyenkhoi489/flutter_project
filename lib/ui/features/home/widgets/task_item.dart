import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';
import 'package:myapp/utils/extensions/task_priority_extension.dart';
import 'package:myapp/utils/extensions/task_status_extension.dart';
import 'package:myapp/utils/helpers/function.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.hex1E1E1E,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 80,
      child: Row(
        children: [
          Container(
            width: 15,
            decoration: BoxDecoration(
              color: task.priority.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    AppIcons.iconCalendar,
                    const SizedBox(width: 7),
                    Text(
                      formatDate(task.createdAt),
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),

              ],
            ),
          ),
          task.status.status,
          const SizedBox(width: 11)
        ],
      ),
    );
  }
}
