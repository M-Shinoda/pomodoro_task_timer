import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';
import 'package:pomodoro_task_timer/utils/notification.dart';

final timerProvider = ChangeNotifierProvider((ref) {
  Timer.periodic(const Duration(milliseconds: 250), (_) {
    final taskList = ref.read(taskListProvider);

    for (final task in taskList) {
      if (task.isRunning && task.remainingDuration.inMilliseconds > 0) {
        ref.read(taskListProvider.notifier).updateTask(
              task.id,
              task.copyWith(
                  remainingDuration: task.remainingDuration -
                      const Duration(milliseconds: 250)),
            );
      } else if (task.isRunning) {
        ref.read(notificationProvider).showNotificationWithSubtitle();
        ref.read(taskListProvider.notifier).stopTask(task.id);
      }
    }
  });
});
