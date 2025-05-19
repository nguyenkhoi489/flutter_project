import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

class TaskTimePickerUi extends StatefulWidget {
  const TaskTimePickerUi({super.key, this.task});

  final Task? task;

  @override
  State<TaskTimePickerUi> createState() => _TaskTimePickerUiState();
}

class _TaskTimePickerUiState extends State<TaskTimePickerUi> {
  @override
  Widget build(BuildContext context) {
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Time',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                child: Container(
                  height: 58,
                  width: (screenWidget - 11) / 2,
                  decoration: const BoxDecoration(
                    color: AppColors.hex181818,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Image(image: AppIcons.iconClock, width: 24),
                      const SizedBox(width: 14),
                      Text(
                        '06 : 00 PM',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'End Time',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                child: Container(
                  height: 58,
                  width: (screenWidget - 11) / 2,
                  decoration: const BoxDecoration(
                    color: AppColors.hex181818,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Image(image: AppIcons.iconClock, width: 24),
                      const SizedBox(width: 14),
                      Text(
                        '09 : 00 PM',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
