import 'package:pomodoro_task_timer/freezed/task_base.dart';
import 'package:uuid/uuid.dart';

class CountUpTaskState extends TaskBase {
  final Duration remainingDuration;
  const CountUpTaskState({
    required String id,
    required String title,
    required Duration duration,
    bool isRunning = false,
    this.remainingDuration = Duration.zero,
  }) : super(id, title, duration, isRunning);

  factory CountUpTaskState.create(
          {required String title, required Duration duration}) =>
      CountUpTaskState(
          id: const Uuid().v8(),
          title: title,
          duration: Duration.zero,
          remainingDuration: duration);

  @override
  CountUpTaskState copyWith(
      {String? id,
      String? title,
      Duration? duration,
      bool? isRunning,
      bool? isFinished,
      Duration? remainingDuration}) {
    return CountUpTaskState(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      isRunning: isRunning ?? this.isRunning,
      remainingDuration: remainingDuration ?? this.remainingDuration,
    );
  }

  @override
  CountUpTaskState durationUpdata(Duration duration, Function notification) {
    if ((this.duration != Duration.zero) && elapsedTimeRatio() == 0.0) {
      notification();
    }
    return copyWith(
      duration: this.duration + duration,
    );
  }

  @override
  bool isFinished() => false;

  @override
  double elapsedTimeRatio() {
    final ratio = duration.inMilliseconds / remainingDuration.inMilliseconds;
    return ratio % (ratio.toInt() == 0 ? 1 : ratio.toInt());
  }

  @override
  Duration get displayTime => duration;
}
