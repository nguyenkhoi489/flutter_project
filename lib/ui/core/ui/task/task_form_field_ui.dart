import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/ui/heading/heading.dart';

class TaskFormFieldUi extends StatefulWidget {
  const TaskFormFieldUi({super.key, this.task});

  final Task? task;

  @override
  State<TaskFormFieldUi> createState() => _TaskFormFieldUiState();
}

class _TaskFormFieldUiState extends State<TaskFormFieldUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const HeadingWidget(title: 'Schedule'),
          const SizedBox(height: 18),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.hex181818,
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.hex181818,
              hintText: 'Description',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
