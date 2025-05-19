import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime
{
  DateTime get startWeek {
    return subtract(Duration(days: weekday - DateTime.monday));
  }

  DateTime get endWeek {
    return add(Duration(days: DateTime.sunday - weekday));
  }

  DateTime get previousWeek {
    return subtract(const Duration(days: DateTime.daysPerWeek));
  }

  DateTime get nextWeek {
    return add(const Duration(days: DateTime.daysPerWeek));
  }

  String get getAbbreviated {
    return DateFormat.E().format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day;
  }

  String get getDayNumber {
    return DateFormat('d').format(this);
  }

  List <DateTime> get daysOfWeek {
    final firstDate = startWeek;
    return List.generate(DateTime.daysPerWeek, (index) {
      return firstDate.add(Duration(days: index));
    });
  }
}
