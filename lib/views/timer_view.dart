import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/component/task_tile.dart';
import 'package:pomodoro_task_timer/component/timer_indicator_component.dart';
import 'package:pomodoro_task_timer/freezed/count_down_task_state.dart';
import 'package:pomodoro_task_timer/freezed/count_up_task_state.dart';
import 'package:pomodoro_task_timer/state/task_state.dart';

class TimerView extends HookConsumerWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(taskListProvider.notifier).addTask(CountDownTaskState.create(
            title: 'Task 1', duration: const Duration(seconds: 5)));
        ref.read(taskListProvider.notifier).addTask(CountDownTaskState.create(
            title: 'Task 2', duration: const Duration(seconds: 3)));
        ref.read(taskListProvider.notifier).addTask(CountUpTaskState.create(
            title: 'Task 2', duration: const Duration(seconds: 5)));
      });
      return null;
    }, const []);

    final taskTiles = taskList.map((task) {
      return TaskTimer(task: task);
    }).toList();

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const Expanded(flex: 1, child: TimerIndicator()),
      Expanded(
          flex: 1,
          child: SingleChildScrollView(child: Column(children: taskTiles)))
    ]);
  }
}
