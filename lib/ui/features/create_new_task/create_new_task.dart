import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';
import 'package:myapp/ui/core/ui/task/task_alert_ui.dart';
import 'package:myapp/ui/core/ui/task/task_form_field_ui.dart';
import 'package:myapp/ui/core/ui/task/task_priority_ui.dart';
import 'package:myapp/ui/core/ui/task/task_time_picker_ui.dart';
import 'package:myapp/ui/core/ui/task/task_week_calendar.dart';
import 'package:myapp/ui/features/create_new_task/widgets/task_action_create.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key, this.task});

  final Task? task;

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: AppBar(
        backgroundColor: AppColors.hex020206,
        centerTitle: true,
        title: const Text(
          'Create new task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 29,
          alignment: Alignment.centerLeft,
          child: const Image(
            image: AppIcons.iconBack,
            width: 29,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskWeekCalendar(
              date: DateTime.now(),
              selectedDate: DateTime.now(),
              onDateSelected: (date) {
                setState(() {

                });
              },
            ),
            const TaskFormFieldUi(),
            const SizedBox(height: 30),
            const TaskTimePickerUi(),
            const SizedBox(height: 30),
            const TaskPriorityUi(),
            const SizedBox(height: 32),
            const TaskAlert(),
            const SizedBox(height: 41),
            const TaskActionCreate(),
          ],
        ),
      ),
    );
  }
}
