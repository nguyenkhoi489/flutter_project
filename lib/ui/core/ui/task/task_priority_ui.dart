import 'package:flutter/material.dart';

import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

class TaskPriorityUi extends StatefulWidget {
  const TaskPriorityUi({super.key, this.task});

  final Task? task;

  @override
  State<TaskPriorityUi> createState() => _TaskPriorityUiState();
}

class _TaskPriorityUiState extends State<TaskPriorityUi> {
  var isChosen = '';

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChosen = 'high';
                  });
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color:
                    isChosen == 'high'
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
                        isChosen == 'high' ? Colors.black : Colors.white,
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
                    isChosen = 'medium';
                  });
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color:
                    isChosen == 'medium'
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
                        isChosen == 'medium' ? Colors.black : Colors.white,
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
                    isChosen = 'low';
                  });
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color:
                    isChosen == 'low'
                        ? AppColors.hexFAD9FF
                        : Colors.transparent,
                    border: Border.all(color: AppColors.hexFAD9FF, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Low',
                      style: TextStyle(
                        color: isChosen == 'low' ? Colors.black : Colors.white,
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
}
