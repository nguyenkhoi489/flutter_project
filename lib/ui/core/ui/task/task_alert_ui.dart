import 'package:flutter/material.dart';

import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

class TaskAlert extends StatefulWidget {
  const TaskAlert({super.key, this.task});

  final Task? task;

  @override
  State<TaskAlert> createState() => _TaskAlertState();
}

class _TaskAlertState extends State<TaskAlert> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'Get alert for this task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Image(
              image: isChecked ? AppIcons.iconActive : AppIcons.iconUnActive,
              width: 54,
            ),
          ),
        ],
      ),
    );
  }
}
