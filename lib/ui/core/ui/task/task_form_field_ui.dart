import 'package:flutter/material.dart';
import 'package:myapp/domain/models/task.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/ui/heading/heading.dart';

class TaskFormFieldUi extends StatefulWidget {
  const TaskFormFieldUi({
    super.key,
    this.task,
    this.onNameChanged,
    this.onDescriptionChanged,
  });

  final Task? task;
  final ValueChanged<String>? onNameChanged;
  final ValueChanged<String>? onDescriptionChanged;

  @override
  State<TaskFormFieldUi> createState() => _TaskFormFieldUiState();
}

class _TaskFormFieldUiState extends State<TaskFormFieldUi> {

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.task);
    if (widget.task != null) {
      _nameController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description ?? '';
    }
    _nameController.addListener(() {
      widget.onNameChanged?.call(_nameController.text);
    });

    _descriptionController.addListener(() {
      widget.onDescriptionChanged?.call(_descriptionController.text);
    });
  }


  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const HeadingWidget(title: 'Schedule'),
          const SizedBox(height: 18),
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.hex181818,
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _descriptionController,
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.hex181818,
              hintText: 'Description',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
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
