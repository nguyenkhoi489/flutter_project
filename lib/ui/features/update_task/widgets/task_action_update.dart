import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

class TaskActionUpdate extends StatelessWidget {
  const TaskActionUpdate({
    super.key,
    required this.onUpdatedItem,
    required this.onDeletedItem,
  });

  final VoidCallback onUpdatedItem;
  final VoidCallback onDeletedItem;

  @override
  Widget build(BuildContext context) {
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onUpdatedItem,
            child: Container(
              width: (screenWidget - 9) / 2,
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
                  'Edit Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onDeletedItem,
            child: Container(
              width: (screenWidget - 9) / 2,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.hexBlack60
              ),
              child: const Center(
                child: Text(
                  'Delete Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
