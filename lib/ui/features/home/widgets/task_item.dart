import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';
import 'package:myapp/ui/features/update_task/update_task_screen.dart';
import 'package:myapp/utils/extensions/datetime_extension.dart';
import 'package:myapp/utils/extensions/task_priority_extension.dart';
import 'package:myapp/utils/extensions/task_status_extension.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onDeletedItem,
    required this.onUpdatedItem,
  });

  final Task task;
  final VoidCallback onDeletedItem;
  final ValueChanged onUpdatedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.hex1E1E1E,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 80,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          final Map<String, dynamic>? result = await Navigator.of(
            context,
          ).push<Map<String, dynamic>>(
            MaterialPageRoute(
              builder: (context) => UpdateTaskScreen(task: task),
            ),
          );

          if (result == null) {
            return;
          }

          final String action = result['action'];
          final Task? updatedTask = result['task'];

          if (action == 'delete') {
            onDeletedItem();
          } else if (action == 'update' && updatedTask != null) {
            onUpdatedItem(updatedTask);
          }
        },

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
                        task.startTime.formatDate(),
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            task.status.status,
            const SizedBox(width: 11),
          ],
        ),
      ),
    );
  }
}
