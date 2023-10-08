import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';
import 'package:pomodoro_task_timer/views/timer_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: const TimerView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(taskListProvider.notifier).addTask(TaskState.create(
                title: "Task hoge", duration: const Duration(minutes: 50)));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
