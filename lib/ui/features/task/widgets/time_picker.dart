import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

import '../../../../domain/models/task.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key, this.task});

  final Task? task;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(height: 7),
              GestureDetector(
                child: Container(
                  height: 58,
                  width: (screenWidget - 11) / 2,
                  decoration: BoxDecoration(
                    color: AppColors.hex181818,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8),
                      Image(image: AppIcons.iconClock, width: 24),
                      SizedBox(width: 14),
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
          SizedBox(width: 11),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(height: 7),
              GestureDetector(
                child: Container(
                  height: 58,
                  width: (screenWidget - 11) / 2,
                  decoration: BoxDecoration(
                    color: AppColors.hex181818,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8),
                      Image(image: AppIcons.iconClock, width: 24),
                      SizedBox(width: 14),
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
