import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';
import 'package:pomodoro_task_timer/utils/timer.dart';

class TaskTimer extends HookConsumerWidget {
  final TaskState task;

  const TaskTimer({required this.task, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.read(timerProvider.notifier);
    final isRunning = ref.watch(taskListProvider
        .select((tasks) => tasks.any((t) => t.id == task.id && t.isRunning)));
    final remainingDurationInSeconds = ref.watch(taskListProvider.select(
        (tasks) => tasks
            .firstWhere((t) => t.id == task.id)
            .remainingDuration
            .inSeconds));

    return ListTile(
      title: Text(task.title),
      tileColor: isRunning ? Colors.red : null,
      subtitle: Text('Time Remaining: $remainingDurationInSeconds seconds'),
      trailing: ElevatedButton(
        onPressed: () {
          if (isRunning) {
            ref.read(taskListProvider.notifier).stopTask(task.id);
          } else {
            ref.read(taskListProvider.notifier).startTask(task.id);
          }
        },
        child: Text(isRunning ? 'Stop' : 'Start'),
      ),
    );
  }
}
