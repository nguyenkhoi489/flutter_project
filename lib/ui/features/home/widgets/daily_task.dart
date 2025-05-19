import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

class DailyTask extends StatelessWidget {
  const DailyTask({
    super.key,
    required this.title,
    required this.subTitle,
    required this.totalTask,
    required this.taskComplete,
  });

  final String title;
  final String subTitle;
  final int totalTask;
  final int taskComplete;

  @override
  Widget build(BuildContext context) {
    const paddingLeft = 16;
    const paddingRight = 27;
    final usableWidth =
        MediaQuery.of(context).size.width - paddingLeft - paddingRight;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16, top: 15, bottom: 23, right: 27),
      decoration: const BoxDecoration(
        color: AppColors.hex181818,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "$taskComplete/$totalTask Task Completed",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                '${taskComplete * 100 ~/ totalTask}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Stack(
            children: [
              Container(
                width: usableWidth,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: AppColors.hexBA83DE.withOpacity(0.41),
                ),
              ),
              Container(
                width: usableWidth * taskComplete / totalTask,
                height: 18,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.hexBA83DE,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
