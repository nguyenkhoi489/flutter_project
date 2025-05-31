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
import 'package:myapp/ui/features/update_task/widgets/task_action_update.dart';
import 'package:myapp/utils/extensions/task_extension.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key, required this.task});

  final Task task;

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {

  Task? _task;

  String? _taskName;
  String? _taskDescription;
  DateTime? _selectedDay;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  TaskPriority? _priority;
  TaskStatus _status = TaskStatus.incomplete;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskName = widget.task.title;
    _taskDescription = widget.task.description;
    _selectedDay = widget.task.time;
    _startTime = TimeOfDay(
      hour: widget.task.startTime.hour,
      minute:widget.task.startTime.minute,
    );
    _endTime = TimeOfDay(
      hour: widget.task.endTime.hour,
      minute: widget.task.endTime.minute,
    );
    _priority = widget.task.priority;
    _status = widget.task.status;
  }

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
    print(_startTime);
    print(_endTime);
    final updatedTask = widget.task.copyWith(
      title: _taskName,
      description: _taskDescription,
      time: _selectedDay,
      startTime: DateTime(
        _selectedDay!.year,
        _selectedDay!.month,
        _selectedDay!.day,
        _startTime!.hour,
        _startTime!.minute,
      ),
      endTime: DateTime(
        _selectedDay!.year,
        _selectedDay!.month,
        _selectedDay!.day,
        _endTime!.hour,
        _endTime!.minute,
      ),
      priority: _priority!,
      status: _status,
      updatedAt: DateTime.now(),
    );
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Updated task successfully'),
            actions: [
              TextButton(
                onPressed:
                    () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pop(
                        {
                          'action': 'update',
                          'task': updatedTask
                        }
                      ),
                    },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
  Future<void> _deleted() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Cancel
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Confirm delete
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      Navigator.of(context).pop({
        'action': 'delete',
        'task': widget.task,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.hex020206,
      appBar: AppBar(
        backgroundColor: AppColors.hex020206,
        centerTitle: true,
        title: Text(
          _taskName!,
          style:const TextStyle(
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
              date: _selectedDay!,
              selectedDate: _selectedDay!,
              onDateSelected: (date) {
                setState(() {
                  _selectedDay = date;
                });
              },
            ),
            TaskFormFieldUi(
              task: widget.task,
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
              startTime: _startTime!,
              endTime: _endTime!,
              startTimeChanged: (startTime) {
                _startTime = startTime;
              },
              endTimeChanged: (endTime) {
                _endTime = endTime;
              },
            ),
            const SizedBox(height: 30),
            TaskPriorityUi(
              taskPriority: _priority,
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
            TaskActionUpdate(
              onUpdatedItem: _submit,
              onDeletedItem: _deleted
            ),
          ],
        ),
      ),
    );
  }
}
