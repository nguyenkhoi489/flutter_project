import 'package:flutter/material.dart';
import 'package:myapp/ui/features/home/home_screen.dart';

void main() {
  runApp(HomePageApp());
}

class HomePageApp extends StatelessWidget {
  const HomePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Example Todolist APP',
      debugShowCheckedModeBanner: false,
      home: const ControlWidget(),
    );
  }
}

class ControlWidget extends StatefulWidget {
  const ControlWidget({super.key});

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HomeScreen()
    );
  }
}
