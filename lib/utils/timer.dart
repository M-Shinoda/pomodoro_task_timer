import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';
import 'package:pomodoro_task_timer/utils/notification.dart';

final timerProvider = StateProvider((ref) {
  const checkPoolingDuration = Duration(milliseconds: 20);
  void notification() {
    ref.read(notificationProvider).showNotificationWithSubtitle();
  }

  Timer.periodic(checkPoolingDuration, (_) {
    final taskList = ref.read(taskListProvider);

    for (final task in taskList) {
      if (task.isRunning && task.isFinished() == false) {
        ref.read(taskListProvider.notifier).updateTask(
              task.id,
              task.durationUpdata(checkPoolingDuration, notification),
            );
      } else if (task.isRunning) {
        ref.read(taskListProvider.notifier).stopTask(task.id);
      }
    }
  });
});
