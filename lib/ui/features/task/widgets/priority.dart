import 'package:flutter/material.dart';

import '../../../../domain/models/task.dart';
import '../../../core/resources/app_colors.dart';

class Priority extends StatefulWidget {
  const Priority({super.key, this.task});

  final Task? task;

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  @override
  Widget build(BuildContext context) {
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Priority',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.hexFACBBA, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'High',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.hexD7F0FF, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Medium',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.hexFAD9FF, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Low',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
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
