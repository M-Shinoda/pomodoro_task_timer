import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';

class TaskTimer extends HookConsumerWidget {
  final TaskState task;

  const TaskTimer({required this.task, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning = ref.watch(taskListProvider
        .select((tasks) => tasks.any((t) => t.id == task.id && t.isRunning)));

    return ListTile(
      title: Text(task.title),
      tileColor: isRunning ? Colors.red : null,
      subtitle:
          Text('Time Remaining: ${task.remainingDuration.inSeconds} seconds'),
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
