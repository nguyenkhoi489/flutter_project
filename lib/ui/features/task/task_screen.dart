import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';
import 'package:myapp/ui/features/task/widgets/action_create.dart';
import 'package:myapp/ui/features/task/widgets/alert.dart';
import 'package:myapp/ui/features/task/widgets/form_field.dart';
import 'package:myapp/ui/features/task/widgets/priority.dart';
import 'package:myapp/ui/features/task/widgets/time_picker.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, this.task});

  final Task? task;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
          margin: EdgeInsets.only(left: 20),
          width: 29,
          alignment: Alignment.centerLeft,
          child: Image(
            image: AppIcons.iconBack,
            width: 29,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                FormFieldWidget(),
                SizedBox(height: 30),
                TimePicker(),
                SizedBox(height: 30),
                Priority(),
                SizedBox(height: 32),
                Alert(),
                SizedBox(height: 41),
                ActionCreate(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
