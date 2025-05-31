import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

class TaskTimePickerUi extends StatefulWidget {
  const TaskTimePickerUi({
    super.key,
    required this.startTime,
    required this.endTime,
    this.startTimeChanged,
    this.endTimeChanged,
  });

  final ValueChanged<TimeOfDay>? startTimeChanged;
  final ValueChanged<TimeOfDay>? endTimeChanged;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  @override
  State<TaskTimePickerUi> createState() => _TaskTimePickerUiState();
}

class _TaskTimePickerUiState extends State<TaskTimePickerUi> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTime = widget.startTime;
    _endTime = widget.endTime;
    print(_startTime);
    print(_endTime);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidget = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Time',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () async {
                  final TimeOfDay? startTimeSelected = await showTimePicker(
                    context: context,
                    initialTime:
                        _startTime != null ? _startTime! : TimeOfDay.now(),
                  );

                  if (startTimeSelected != null) {
                    setState(() {
                      _startTime = startTimeSelected;
                    });
                    if (widget.startTimeChanged != null && _startTime != null) {
                      widget.startTimeChanged!(_startTime!);
                    }
                  }
                },
                child: Container(
                  height: 58,
                  width: (screenWidget - 11) / 2,
                  decoration: const BoxDecoration(
                    color: AppColors.hex181818,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Image(image: AppIcons.iconClock, width: 24),
                      const SizedBox(width: 14),
                      Text(
                        _startTime!.format(context),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'End Time',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () async {
                  final TimeOfDay? endTimeSelected = await showTimePicker(
                    context: context,
                    initialTime: _endTime != null ? _endTime! : TimeOfDay.now(),
                  );
                  if (endTimeSelected != null) {
                    setState(() {
                      _endTime = endTimeSelected;
                    });
                    if (widget.endTimeChanged != null && _endTime != null) {
                      widget.endTimeChanged!(_endTime!);
                    }
                  }
                },
                child: Container(
                  height: 58,
                  width: (screenWidget - 11) / 2,
                  decoration: const BoxDecoration(
                    color: AppColors.hex181818,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Image(image: AppIcons.iconClock, width: 24),
                      const SizedBox(width: 14),
                      Text(
                        _endTime!.format(context),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
