import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_task_timer/freezed/time_keeper_model.dart';
import 'package:pomodoro_task_timer/utils/timer_model.dart';

class TimerView extends HookConsumerWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeKeeper = ref.watch(timeKeeperProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(checkTimerProvider).startTimeKeeper(timeKeeper);
      });
      return;
    }, const []);

    return Container(
      color: timeKeeper.isActive ? null : Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            timeKeeper.remainingDuration.inSeconds.toString(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
