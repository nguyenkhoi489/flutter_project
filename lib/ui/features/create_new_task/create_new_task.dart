import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/domain/models/task_status.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';
import 'package:myapp/ui/core/ui/task/task_alert_ui.dart';
import 'package:myapp/ui/core/ui/task/task_form_field_ui.dart';
import 'package:myapp/ui/core/ui/task/task_priority_ui.dart';
import 'package:myapp/ui/core/ui/task/task_time_picker_ui.dart';
import 'package:myapp/ui/core/ui/task/task_week_calendar.dart';
import 'package:myapp/ui/features/create_new_task/widgets/task_action_create.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  Task? task;

  String? _taskName;
  String? _taskDescription;
  DateTime _selectedDay = DateTime.now();
  TimeOfDay _startTime = TimeOfDay(hour: 6, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 18, minute: 0);
  TaskPriority? _priority;
  TaskStatus _status = TaskStatus.incomplete;

  Future<void> _submit() async {
    if (_taskName == null || _taskName!.isEmpty) {
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Warning'),
              content: const Text('Please enter the task name'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  //Hàm này để đóng dialog
                  child: const Text('OK'),
                ),
              ],
            ),
      );
      return;
    }
    if (_priority == null) {
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Warning'),
              content: const Text('Please select a priority'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  //Hàm này để đóng dialog
                  child: const Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

    task = Task(
      time: _selectedDay,
      title: _taskName!,
      description: _taskDescription!,
      startTime: DateTime(
        _selectedDay.year,
        _selectedDay.month,
        _selectedDay.day,
        _startTime.hour,
        _startTime.minute,
      ),
      endTime: DateTime(
        _selectedDay.year,
        _selectedDay.month,
        _selectedDay.day,
        _endTime.hour,
        _endTime.minute,
      ),
      priority: _priority!,
      status: _status,
      createdAt: DateTime.now(),
    );
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('New task added successfully'),
            actions: [
              TextButton(
                onPressed:
                    () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pop(task),
                    },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskWeekCalendar(
              date: DateTime.now(),
              selectedDate: DateTime.now(),
              onDateSelected: (date) {
                setState(() {
                  _selectedDay = date;
                });
              },
            ),
            TaskFormFieldUi(
              onNameChanged: (name) {
                setState(() {
                  _taskName = name;
                });
              },
              onDescriptionChanged: (description) {
                setState(() {
                  _taskDescription = description;
                });
              },
            ),
            const SizedBox(height: 30),
            TaskTimePickerUi(
              startTime: _startTime,
              endTime:_endTime,
              startTimeChanged: (startTime) {
                _startTime = startTime;
              },
              endTimeChanged: (endTime) {
                _endTime = endTime;
              },
            ),
            const SizedBox(height: 30),
            TaskPriorityUi(
              onPriorityChanged: (prioritySelected) {
                setState(() {
                  _priority = prioritySelected;
                });
              },
            ),
            const SizedBox(height: 32),
            TaskAlert(
              status: _status,
              onStatusChanged: (status) {
                _status = status;
              },
            ),
            const SizedBox(height: 41),
            TaskActionCreate(onCreateTask: _submit),
          ],
        ),
      ),
    );
  }
}
