import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/ui/heading/heading.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({super.key, this.task});

  final Task? task;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          HeadingWidget(title: 'Schedule'),
          SizedBox(height: 18),
          TextFormField(
            autofocus: false,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.hex181818,
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            maxLines: 4,
            autofocus: false,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.hex181818,
              hintText: 'Description',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
