import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
    required this.title,
    this.actionName
  });

  final String title;
  final String? actionName;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22
            ),
          ),
          if (actionName != null )
            Text(
              actionName!,
              style: TextStyle(
                color: AppColors.hexBA83DE,
                fontSize: 16
              ),
            )
        ]
    );
  }
}
