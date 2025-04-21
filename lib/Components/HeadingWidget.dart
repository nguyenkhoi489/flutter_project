import 'package:flutter/material.dart';


class HeadingWidget extends StatefulWidget {
  const HeadingWidget({super.key, required this.title});

  final String title;

  @override
  State<HeadingWidget> createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'See All',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFBA83DE),
            ),
          ),
        ],
      ),
    );
  }
}
