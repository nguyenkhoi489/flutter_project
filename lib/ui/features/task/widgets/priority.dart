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
  var isChoosed;
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
                onTap: () {
                  setState(() {
                    isChoosed = 'high';
                  });
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color: isChoosed == 'high' ? AppColors.hexFACBBA : Colors.transparent,
                    border: Border.all(color: AppColors.hexFACBBA, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'High',
                      style: TextStyle(
                        color: isChoosed == 'high' ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChoosed = 'medium';
                  });
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color: isChoosed == 'medium' ? AppColors.hexD7F0FF : Colors.transparent,
                    border: Border.all(color: AppColors.hexD7F0FF, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Medium',
                      style: TextStyle(
                        color: isChoosed == 'medium' ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChoosed = 'low';
                  });
                },
                child: Container(
                  height: 40,
                  width: (screenWidget - 20) / 3,
                  decoration: BoxDecoration(
                    color: isChoosed == 'low' ? AppColors.hexFAD9FF : Colors.transparent,
                    border: Border.all(color: AppColors.hexFAD9FF, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Low',
                      style: TextStyle(
                        color: isChoosed == 'low' ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w400,
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
