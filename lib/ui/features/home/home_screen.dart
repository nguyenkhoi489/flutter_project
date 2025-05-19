import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/domain/models/task_status.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/ui/heading/heading.dart';
import 'package:myapp/ui/features/home/widgets/daily_task.dart';
import 'package:myapp/ui/features/home/widgets/nav.dart';
import 'package:myapp/ui/features/home/widgets/search.dart';
import 'package:myapp/ui/features/home/widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Task> todayTasks = [
    Task(
      time: DateTime.now(),
      title: 'Mobile App Research',
      description: 'description',
      startTime: DateTime(1, 1, 2025),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.high,
      status: TaskStatus.complete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Wireframe for Main Flow',
      description: 'description',
      startTime: DateTime(1, 1, 2025),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.medium,
      status: TaskStatus.complete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Screens',
      description: 'description',
      startTime: DateTime(1, 1, 2025),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.low,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
  ];

  int get taskComplete =>
      todayTasks.where((task) => task.status == TaskStatus.complete).length;

  final List<Task> tomorrowTasks = [
    Task(
      time: DateTime.now(),
      title: 'Website Research',
      description: 'description',
      startTime: DateTime(1, 1, 2025),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.high,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Wireframe for Main Flow',
      description: 'description',
      startTime: DateTime(1, 1, 2025),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.medium,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Screens',
      description: 'description',
      startTime: DateTime(1, 1, 2025),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.low,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Nav(),
              const SizedBox(height: 22),
              const Search(),
              const SizedBox(height: 22),
              const HeadingWidget(title: 'Progress', actionName: 'See All'),
              const SizedBox(height: 20),
              DailyTask(
                title: 'Daily Task',
                subTitle: 'You are almost done go ahead',
                totalTask: todayTasks.length,
                taskComplete: taskComplete,
              ),
              const SizedBox(height: 30),
              const HeadingWidget(title: 'Today’s Task', actionName: 'See All'),
              const SizedBox(height: 20),
              for (int i = 0; i < todayTasks.length; i++) ...[
                TaskItem(task: todayTasks[i]),
                if (i != todayTasks.length - 1)
                  const SizedBox(height: 10)
                else
                  const SizedBox(height: 30),
              ],
              const HeadingWidget(
                title: 'Tomorrow Task',
                actionName: 'See All',
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < tomorrowTasks.length; i++) ...[
                TaskItem(task: tomorrowTasks[i]),
                if (i != tomorrowTasks.length - 1)
                  const SizedBox(height: 10)
                else
                  const SizedBox(height: 18),
              ],
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.hexDE83B0, AppColors.hexC59ADF],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, color: AppColors.hex292D32, size: 30),
        ),
      ),
    );
  }

}
