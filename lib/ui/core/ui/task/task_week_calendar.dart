import 'package:flutter/material.dart';
import 'package:myapp/ui/core/ui/task/task_week_calendar_item.dart';
import 'package:myapp/ui/core/ui/task/task_week_header.dart';
import 'package:myapp/utils/extensions/datetime_extension.dart';

class TaskWeekCalendar extends StatefulWidget {
  const TaskWeekCalendar({
    required this.date,
    required this.selectedDate,
    required this.onDateSelected,
    super.key,
  });

  final DateTime date;

  final DateTime selectedDate;

  final ValueChanged<DateTime> onDateSelected;

  @override
  State<TaskWeekCalendar> createState() => _TaskWeekCalendarState();
}

class _TaskWeekCalendarState extends State<TaskWeekCalendar> {
  late DateTime _date;

  DateTime? _selectedDate;

  late int _initialPage = 520;

  late PageController _pageController;

  late final List<DateTime> _dates;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _date = widget.date;
    _selectedDate = widget.selectedDate;
    _dates = [_date.previousWeek, _date, _date.nextWeek];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskWeekHeader(
          date: _date,
          onPreviousWeek: () async {
            setState(() {
              _initialPage--;
            });
            await _pageController.animateToPage(
              _initialPage,
              duration: const Duration(microseconds: 3000),
              curve: Curves.easeInOut,
            );
          },
          onNextWeek: () async {
            setState(() {
              _initialPage++;
            });
            await _pageController.animateToPage(
              _initialPage,
              duration: const Duration(microseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        SizedBox(
          height:
              ((MediaQuery.of(context).size.width - 6 * 2) /
                  DateTime.daysPerWeek) /
              (58 / 70),
          child: PageView.builder(
            itemBuilder: (content, index) {
              return TaskWeekCalendarItem(
                dates: _dates[index % _dates.length].daysOfWeek,
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                  widget.onDateSelected(date);
                },
              );
            },
            controller: _pageController,
            onPageChanged: _onChangeWeek,
          ),
        ),
      ],
    );
  }

  void _onChangeWeek(int pageIndex) {
    final initPage = pageIndex % 3;
    setState(() {
      _date = _dates[initPage];
      _initialPage = pageIndex;
    });
    if (initPage == 0) {
      _dates[1] = _date.nextWeek;
      _dates[2] = _date.previousWeek;
    } else if (initPage == 2) {
      _dates[0] = _date.nextWeek;
      _dates[1] = _date.previousWeek;
    } else {
      _dates[0] = _date.previousWeek;
      _dates[2] = _date.nextWeek;
    }
  }
}

/// 1 2 0 1 2 0 1 2 0 1 2
