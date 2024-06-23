import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/state/selected_task_id.dart';
import 'package:pomodoro_task_timer/state/task_state.dart';

class TimerIndicator extends HookConsumerWidget {
  const TimerIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final selectTaskId = ref.watch(selectedTaskId);
    final controller = useAnimationController(
        duration: const Duration(milliseconds: 10),
        animationBehavior: AnimationBehavior.preserve);

    final selectedTask = useMemoized(() {
      if (selectTaskId == null) return null;
      return taskList[taskList.indexWhere((task) => task.id == selectTaskId)];
    }, [taskList, selectTaskId]);

    useEffect(() {
      if (selectedTask == null) return;
      controller.animateTo(
        selectedTask.elapsedTimeRatio(),
        curve: Curves.bounceIn,
      );
      return null;
    }, [selectedTask]);

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Circular progress indicator'),
        ),
      ),
    );
  }
}
