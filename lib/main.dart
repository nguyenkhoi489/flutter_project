import 'package:flutter/material.dart';
import 'package:myapp/Components/DailyTaskWidget.dart';
import 'package:myapp/Components/HeadingWidget.dart';
import 'package:myapp/Components/NavBarWidget.dart';
import 'package:myapp/Components/SearchBarWidget.dart';
import 'package:myapp/Components/TaskItemWidget.dart';

void main() {
  runApp(HomePageApp());
}

class HomePageApp extends StatelessWidget {
  const HomePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Example Todolist APP',
      debugShowCheckedModeBanner: false,
      home: const ControlWidget(),
    );
  }
}

class ControlWidget extends StatefulWidget {
  const ControlWidget({super.key});

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Mobile App Research',
      'date': '4 Oct',
      'colorDefault': const Color(0xFFFFD6D6),
    },
    {
      'title': 'Prepare Wireframe for Main Flow',
      'date': '4 Oct',
      'colorDefault': const Color(0xFFD7F0FF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NavBarWidget(),
      body: Column(
        children: [
          SearchBarWidget(),
          HeadingWidget(title: 'Progress'),
          DailyTaskWidget(
            title: 'Daily Task',
            subtitle: '2/3 Task Completed',
            description: 'You are almost done go ahead',
            progress: 0.66,
          ),
          HeadingWidget(title: 'Today’s Task'),
          for (var item in items)
            TaskItem(
              title: item['title'],
              date: item['date'],
              colorDefault: item['colorDefault'],
              isChecked: item['isChecked'] ?? true,
            ),
        ],
      ),
    );
  }
}
