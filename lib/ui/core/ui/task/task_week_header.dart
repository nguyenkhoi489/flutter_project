import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';
import 'package:myapp/utils/extensions/datetime_extension.dart';

class TaskWeekHeader extends StatelessWidget {
  const TaskWeekHeader({
    required this.date,
    required this.onPreviousWeek,
    required this.onNextWeek,
    super.key
  });

  final DateTime date;

  final VoidCallback onPreviousWeek;

  final VoidCallback onNextWeek;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onPreviousWeek,
          child: const SizedBox(
            width: 44,
            height: 44,
            child: Center(
              child: Image(
                image: AppIcons.iconPrev,
                height: 17,
              ),
            ),
          ),
        ),
        Expanded(
            child: Text(
              '${date.startWeek.formatDate()} - ${date.endWeek.formatDate()}',
              style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.hexBA83DE
              ),
              textAlign: TextAlign.center,
            )
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onNextWeek,
          child: const SizedBox(
            width: 44,
            height: 44,
            child: Center(
              child: Image(
                image: AppIcons.iconNext,
                height: 17,
              ),
            ),
          ),
        )
      ],
    );
  }
}
