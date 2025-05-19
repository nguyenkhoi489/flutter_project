import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

class TaskActionCreate extends StatelessWidget {
  const TaskActionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        child: Container(
          width: screenWidget,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              colors: [
                AppColors.hexBA83DE,
                AppColors.hexCD83C6,
                AppColors.hexDE83B0,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Create Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
