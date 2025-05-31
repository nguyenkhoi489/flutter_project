import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/utils/extensions/datetime_extension.dart';

class TaskWeekCalendarItem extends StatelessWidget {
  const TaskWeekCalendarItem({
    super.key,
    required this.dates,
    required this.onDateSelected,
    this.selectedDate,
  });

  final List<DateTime> dates;

  final DateTime? selectedDate;

  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    final weekCalendarWidth = MediaQuery.of(context).size.width - 12;
    final itemWidth = (weekCalendarWidth / DateTime.daysPerWeek) * (58 / 70);
    final itemHeight = (weekCalendarWidth / DateTime.daysPerWeek) / (58 / 70);
    final itemTextWidth =
        (weekCalendarWidth / DateTime.daysPerWeek) * (31 / 48);
    final itemTextHeight =
        (weekCalendarWidth / DateTime.daysPerWeek) / (31 / 48);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        children: [
          ...dates.map((date) {
            final isSelectedDay = selectedDate?.isSameDate(date) ?? false;
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onDateSelected(date),
              child: SizedBox(
                height: itemHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      width: itemTextWidth,
                      height: itemTextHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date.getAbbreviated,
                            style: TextStyle(
                              color:
                                  isSelectedDay
                                      ? AppColors.hexBA83DE
                                      : AppColors.hexWhite60,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            date.getDayNumber,
                            style: TextStyle(
                              color:
                                  isSelectedDay
                                      ? AppColors.hexBA83DE
                                      : AppColors.hexWhite60,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: itemWidth,
                      height: itemHeight,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              isSelectedDay
                                  ? AppColors.hexBA83DE
                                  : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          isSelectedDay
                              ? const Radius.circular(10)
                              : Radius.zero,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              isSelectedDay
                                  ? AppColors.hexBA83DE
                                  : Colors.transparent,
                          borderRadius: BorderRadius.all(
                            isSelectedDay
                                ? const Radius.circular(100)
                                : Radius.zero,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
