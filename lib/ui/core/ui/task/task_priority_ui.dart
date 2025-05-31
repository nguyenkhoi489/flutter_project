import 'package:flutter/material.dart';

import 'package:myapp/domain/models/task.dart';
import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

class TaskPriorityUi extends StatefulWidget {
  const TaskPriorityUi({super.key, this.taskPriority, required this.onPriorityChanged});

  final TaskPriority? taskPriority;

  final ValueChanged onPriorityChanged;

  @override
  State<TaskPriorityUi> createState() => _TaskPriorityUiState();
}

class _TaskPriorityUiState extends State<TaskPriorityUi> {
  TaskPriority? isPriority;
  String? _priorityError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.taskPriority != null)
      {
        isPriority = widget.taskPriority;
      }
  }
  @override
  Widget build(BuildContext context) {
    print(isPriority);
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Priority',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (_priorityError != null)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                _priorityError!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPriority = TaskPriority.high;
                  });
                  widget.onPriorityChanged(isPriority);
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color:
                        isPriority == TaskPriority.high
                            ? AppColors.hexFACBBA
                            : Colors.transparent,
                    border: Border.all(color: AppColors.hexFACBBA, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'High',
                      style: TextStyle(
                        color:
                            isPriority == TaskPriority.high
                                ? Colors.black
                                : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPriority = TaskPriority.medium;
                  });
                  widget.onPriorityChanged(isPriority);
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color:
                        isPriority == TaskPriority.medium
                            ? AppColors.hexD7F0FF
                            : Colors.transparent,
                    border: Border.all(color: AppColors.hexD7F0FF, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Medium',
                      style: TextStyle(
                        color:
                            isPriority == TaskPriority.medium
                                ? Colors.black
                                : Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPriority = TaskPriority.low;
                  });
                  widget.onPriorityChanged(isPriority);
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color:
                        isPriority == TaskPriority.low
                            ? AppColors.hexFAD9FF
                            : Colors.transparent,
                    border: Border.all(color: AppColors.hexFAD9FF, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Low',
                      style: TextStyle(
                        color:
                            isPriority == TaskPriority.low
                                ? Colors.black
                                : Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void validatePriority() {
    setState(() {
      _priorityError = isPriority == null ? 'Vui lòng chọn độ ưu tiên' : null;
    });
  }
}
