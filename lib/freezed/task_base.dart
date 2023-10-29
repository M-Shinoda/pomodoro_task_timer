import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TaskBase {
  final String id;
  final String title;
  final Duration duration;
  final bool isRunning;

  const TaskBase(
    this.id,
    this.title,
    this.duration,
    this.isRunning,
  );

  TaskBase copyWith();

  TaskBase durationUpdata(Duration duration, Function notification);

  bool isFinished();

  double elapsedTimeRatio();

  Duration get displayTime;
}
