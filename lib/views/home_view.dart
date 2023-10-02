import 'package:flutter/material.dart';
import 'package:pomodoro_task_timer/views/timer_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: TimerView(),
      ),
    );
  }
}
