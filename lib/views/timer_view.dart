import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';
import 'package:pomodoro_task_timer/utils/task_tile.dart';
import 'package:pomodoro_task_timer/utils/timer.dart';

class TimerView extends HookConsumerWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final _ = ref.read(timerProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(taskListProvider.notifier).addTask(TaskState.create(
            title: 'Task 1', duration: const Duration(seconds: 10)));
        ref.read(taskListProvider.notifier).addTask(TaskState.create(
            title: 'Task 2', duration: const Duration(seconds: 20)));
      });

      return null;
    }, const []);

    final taskTiles = useMemoized(
        () => taskList.map((task) => TaskTimer(task: task)).toList(),
        [taskList]);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center, children: taskTiles);
  }
}
