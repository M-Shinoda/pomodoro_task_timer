import 'package:flutter/material.dart';
import 'package:pomodoro_task_timer/freezed/task_base.dart';
import 'package:uuid/uuid.dart';

class CountDownTaskState extends TaskBase {
  final Duration remainingDuration;
  const CountDownTaskState({
    required String id,
    required String title,
    required Duration duration,
    bool isRunning = false,
    this.remainingDuration = Duration.zero,
  }) : super(id, title, duration, isRunning);

  factory CountDownTaskState.create(
          {required String title, required Duration duration}) =>
      CountDownTaskState(
          id: const Uuid().v8(),
          title: title,
          duration: duration,
          remainingDuration: duration);

  @override
  CountDownTaskState copyWith(
      {String? id,
      String? title,
      Duration? duration,
      bool? isRunning,
      bool? isFinished,
      Duration? remainingDuration}) {
    return CountDownTaskState(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      isRunning: isRunning ?? this.isRunning,
      remainingDuration: remainingDuration ?? this.remainingDuration,
    );
  }

  bool _isNextFinished({Duration? nextDuration}) =>
      (remainingDuration - (nextDuration ?? Duration.zero)).inMilliseconds < 0;

  @override
  CountDownTaskState durationUpdata(Duration duration, Function notification) {
    final isNextFinished = _isNextFinished(nextDuration: duration);
    if (isNextFinished) notification();
    return copyWith(
      isFinished: isNextFinished,
      remainingDuration: remainingDuration - duration,
    );
  }

  @override
  bool isFinished() => remainingDuration.inMilliseconds < 0;

  @override
  double elapsedTimeRatio() =>
      1.0 - remainingDuration.inMilliseconds / duration.inMilliseconds;

  @override
  Duration get displayTime => remainingDuration;
}
