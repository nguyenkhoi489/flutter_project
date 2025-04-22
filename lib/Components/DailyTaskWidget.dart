import 'package:flutter/material.dart';

class DailyTaskWidget extends StatelessWidget {
  const DailyTaskWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.progress,
  });

  final String title;
  final String subtitle;
  final String description;
  final double progress;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          SizedBox(height: 4),
          Text(subtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description,
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text("${(progress * 100).toInt()}%",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: Color(0xFF2D2B3A),

            ),
          ),
        ],
      ),
    );
  }
}
