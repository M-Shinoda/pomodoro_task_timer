import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/views/home_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(home: HomeView()),
    ),
  );
}
