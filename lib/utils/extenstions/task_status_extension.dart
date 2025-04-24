import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task_status.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

extension TaskStatusExtension on TaskStatus {
  Image get status {
    switch (this) {
      case TaskStatus.complete:
        return AppIcons.iconChecked;
      case TaskStatus.incomplete:
        return AppIcons.iconUnChecked;
    }
  }
}