import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/component/timer_indicator_component.dart';
import 'package:pomodoro_task_timer/freezed/count_down_task_state.dart';
import 'package:pomodoro_task_timer/freezed/count_up_task_state.dart';
import 'package:pomodoro_task_timer/freezed/task_state.dart';
import 'package:pomodoro_task_timer/utils/task_tile.dart';

class TimerView extends HookConsumerWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final controller = useAnimationController(
        duration: const Duration(milliseconds: 250),
        animationBehavior: AnimationBehavior.preserve);
    final selectTaskId = useState<String?>(null);

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

    final taskTiles = useMemoized(
        () => taskList
            .map((task) => GestureDetector(
                onTap: () {
                  selectTaskId.value = task.id;
                },
                child: TaskTimer(task: task)))
            .toList(),
        [taskList]);

    final selectedTask = useMemoized(() {
      if (selectTaskId.value == null) return null;
      return taskList[
          taskList.indexWhere((task) => task.id == selectTaskId.value)];
    }, [taskList, selectTaskId.value]);

    useEffect(() {
      if (selectedTask == null) return;
      controller.animateTo(
        selectedTask.elapsedTimeRatio(),
        curve: Curves.bounceIn,
      );
      return null;
    }, [selectedTask]);

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(flex: 1, child: timerIndicatorComponent(controller)),
      Expanded(
          flex: 1,
          child: SingleChildScrollView(child: Column(children: taskTiles)))
    ]);
  }
}
