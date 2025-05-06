import 'package:flutter/material.dart';

import '../../../../domain/models/task.dart';
import '../../../core/resources/app_icons.dart';

class Alert extends StatefulWidget {
  const Alert({super.key, this.task});

  final Task? task;

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Get alert for this task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Image(
              image: isChecked ? AppIcons.iconActive : AppIcons.iconUnActive,
              width: 54,
            ),
          ),
        ],
      ),
    );
  }
}
