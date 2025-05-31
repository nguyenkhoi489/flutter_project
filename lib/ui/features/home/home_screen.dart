import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/domain/models/task_status.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/ui/heading/heading.dart';
import 'package:myapp/ui/features/create_new_task/create_new_task.dart';
import 'package:myapp/ui/features/home/widgets/daily_task.dart';
import 'package:myapp/ui/features/home/widgets/nav.dart';
import 'package:myapp/ui/features/home/widgets/search.dart';
import 'package:myapp/ui/features/home/widgets/task_item.dart';
import 'package:myapp/utils/extensions/datetime_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [
    Task(
      time: DateTime.now(),
      title: 'Mobile App Research',
      description: 'description',
      startTime: DateTime.now(),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.high,
      status: TaskStatus.complete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Wireframe for Main Flow',
      description: 'description',
      startTime: DateTime.now(),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.medium,
      status: TaskStatus.complete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Screens',
      description: 'description',
      startTime: DateTime.now(),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.low,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Website Research',
      description: 'description',
      startTime: DateUtils.dateOnly(DateTime.now()).add(
          const Duration(days: 1)),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.high,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
    Task(
      time: DateTime.now(),
      title: 'Prepare Wireframe for Main Flow',
      description: 'description',
      startTime: DateUtils.dateOnly(DateTime.now()).add(
          const Duration(days: 1)),
      endTime: DateTime(1, 1, 2026),
      priority: TaskPriority.medium,
      status: TaskStatus.incomplete,
      createdAt: DateTime.now(),
    ),
    Task(
        time: DateTime.now(),
        title: 'Prepare Screens',
        description: 'description',
        startTime: DateUtils.dateOnly(DateTime.now()).add(
            const Duration(days: 1)),
        endTime: DateTime(1, 1, 2026),
        priority: TaskPriority.low,
        status: TaskStatus.incomplete,
        createdAt: DateTime.now()
    ),
  ];

  int get taskComplete =>
      tasks
          .where(
            (task) =>
        task.status == TaskStatus.complete &&
            task.startTime.isSameDate(DateTime.now()),
      )
          .length;

  List<Task> get todayTask =>
      tasks.where((task) => task.startTime.isSameDate(DateTime.now())).toList();

  List<Task> get tomorrowTask =>
      tasks
          .where(
            (task) =>
            task.startTime.isSameDate(
              DateTime.now().add(const Duration(days: 1)),
            ),
      )
          .toList();

  List<Task> get moreTask => tasks.where((task) {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));
    return !task.startTime.isSameDate(now) && !task.startTime.isSameDate(tomorrow);
  }).toList();


  void deleteItem(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void updateItem(Task updatedTask) {
    setState(() {
      print(updatedTask);
      final index = tasks.indexWhere(
            (task) => task.createdAt == updatedTask.createdAt,
      );
      if (index != -1) {
        tasks[index] = updatedTask;
      }
    });
  }

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
              Nav(taskComplete: taskComplete),
              const SizedBox(height: 22),
              const Search(),
              const SizedBox(height: 22),
              const HeadingWidget(title: 'Progress', actionName: 'See All'),
              const SizedBox(height: 20),
              DailyTask(
                title: 'Daily Task',
                subTitle: 'You are almost done go ahead',
                totalTask: todayTask.length,
                taskComplete: taskComplete,
              ),
              const SizedBox(height: 30),
              const HeadingWidget(title: 'Today’s Task', actionName: 'See All'),
              const SizedBox(height: 20),
              for (int i = 0; i < todayTask.length; i++) ...[
                TaskItem(
                    task: todayTask[i],
                    onDeletedItem: () => deleteItem(todayTask[i]),
                    onUpdatedItem: (taskUpdate) {
                      updateItem(taskUpdate);
                    }
                ),
                if (i != todayTask.length - 1)
                  const SizedBox(height: 10)
                else
                  const SizedBox(height: 30),
              ],
              const HeadingWidget(
                title: 'Tomorrow Task',
                actionName: 'See All',
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < tomorrowTask.length; i++) ...[
                TaskItem(
                    task: tomorrowTask[i],
                    onDeletedItem: () => deleteItem(tomorrowTask[i]),
                    onUpdatedItem: (taskUpdate) {
                      updateItem(taskUpdate);
                    }
                ),
                if (i != tomorrowTask.length - 1)
                  const SizedBox(height: 10)
                else
                  const SizedBox(height: 18),
              ],
              const HeadingWidget(
                title: 'More Task',
                actionName: 'See All',
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < moreTask.length; i++) ...[
                TaskItem(
                    task: moreTask[i],
                    onDeletedItem: () => deleteItem(moreTask[i]),
                    onUpdatedItem: (taskUpdate) {
                      updateItem(taskUpdate);
                    }
                ),
                if (i != moreTask.length - 1)
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
            colors: [AppColors.hexDE83B0, AppColors.hexC59ADF],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          onPressed: () async {
            final newTask = await Navigator.of(context).push<Task>(
              MaterialPageRoute(builder: (context) => const CreateNewTask()),
            );

            if (newTask != null) {
              setState(() {
                tasks.add(newTask);
              });
            }
          },
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, color: AppColors.hex292D32, size: 30),
        ),
      ),
    );
  }
}
