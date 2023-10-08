import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState({
    required String id,
    required String title,
    required Duration duration,
    @Default(false) bool isRunning,
    @Default(Duration.zero) Duration remainingDuration,
  }) = _TaskState;

  factory TaskState.create(
          {required String title, required Duration duration}) =>
      TaskState(
          id: const Uuid().v8(),
          title: title,
          duration: duration,
          remainingDuration: duration);
}

final taskListProvider = StateNotifierProvider<TaskList, List<TaskState>>(
  (ref) => TaskList(),
);

class TaskList extends StateNotifier<List<TaskState>> {
  TaskList() : super([]);

  void addTask(TaskState task) {
    state = [...state, task];
  }

  void startTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(isRunning: true);
      } else {
        return task;
      }
    }).toList();
  }

  void stopTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(isRunning: false);
      } else {
        return task;
      }
    }).toList();
  }

  void updateTask(String id, TaskState updatedTask) {
    state = state.map((task) {
      if (task.id == id) {
        return updatedTask;
      } else {
        return task;
      }
    }).toList();
  }
}
