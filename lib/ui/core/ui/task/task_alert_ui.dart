import 'package:flutter/material.dart';

import 'package:myapp/domain/models/task.dart';
import 'package:myapp/domain/models/task_status.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

class TaskAlert extends StatefulWidget {
  const TaskAlert({
    super.key,
    this.task,
    required this.onStatusChanged,
    required this.status,
  });

  final Task? task;

  final TaskStatus status;

  final ValueChanged<TaskStatus> onStatusChanged;

  @override
  State<TaskAlert> createState() => _TaskAlertState();
}

class _TaskAlertState extends State<TaskAlert> {
  TaskStatus? _status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _status = widget.status;
  }

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
                _status =
                _status == TaskStatus.complete
                        ? TaskStatus.incomplete
                        : TaskStatus.complete;
              });
              widget.onStatusChanged(_status!);
            },
            child: Image(
              image:
              _status == TaskStatus.complete
                      ? AppIcons.iconActive
                      : AppIcons.iconUnActive,
              width: 54,
            ),
          ),
        ],
      ),
    );
  }
}
