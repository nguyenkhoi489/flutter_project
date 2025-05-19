import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task_priority.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

extension TaskPriorityExtension on TaskPriority {
   Color get color {
    switch (this) {
      case TaskPriority.high:
        return AppColors.hexFACBBA;
      case TaskPriority.medium:
        return AppColors.hexD7F0FF;
      case TaskPriority.low:
        return AppColors.hexFAD9FF;
    }
  }
}