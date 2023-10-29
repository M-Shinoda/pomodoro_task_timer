import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/count_down_task_state.dart';
import 'package:pomodoro_task_timer/freezed/count_up_task_state.dart';
import 'package:pomodoro_task_timer/freezed/task_base.dart';

final taskListProvider = StateNotifierProvider<TaskList, List<TaskBase>>(
  (ref) => TaskList(),
);

class TaskList extends StateNotifier<List<TaskBase>> {
  TaskList() : super([]);

  void addTask(TaskBase task) {
    state = [...state, task];
  }

  void startTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return copyWithDivideTaskStateClass(task, isRunning: true);
      } else {
        return task;
      }
    }).toList();
  }

  void stopTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return copyWithDivideTaskStateClass(task, isRunning: false);
      } else {
        return task;
      }
    }).toList();
  }

  void updateTask(String id, TaskBase updatedTask) {
    state = state.map((task) {
      if (task.id == id) {
        return updatedTask;
      } else {
        return task;
      }
    }).toList();
  }

  TaskBase copyWithDivideTaskStateClass(TaskBase task,
      {String? id,
      String? title,
      Duration? duration,
      bool? isRunning,
      Duration? remainingDuration}) {
    switch (task.runtimeType) {
      case CountDownTaskState:
        return (task as CountDownTaskState).copyWith(
          id: id,
          title: title,
          isRunning: isRunning,
          remainingDuration: remainingDuration,
        );

      case CountUpTaskState:
        return (task as CountUpTaskState).copyWith(
          id: id,
          title: title,
          isRunning: isRunning,
          duration: duration,
        );
      default:
        throw ("invalid class");
    }
  }
}
