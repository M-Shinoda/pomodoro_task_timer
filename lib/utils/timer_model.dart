import 'dart:async';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_task_timer/utils/time_keeper_model.dart';

final checkTimerProvider = ChangeNotifierProvider((ref) => CheckTimerModel());

class CheckTimerModel extends ChangeNotifier {
  Timer? timer;
  List<TimeKeeperModel> updateTimeNotifiers = [];

  CheckTimerModel() {
    timer = Timer.periodic(const Duration(milliseconds: 250), _update);
  }

  void startTimeKeeper(TimeKeeperModel timeKeeper) {
    timeKeeper.start();
    updateTimeNotifiers.add(timeKeeper);
    notifyListeners();
  }

  void removeKeeper(TimeKeeperModel timeKeeper) {
    updateTimeNotifiers.remove(timeKeeper);
  }

  void _update(Timer timer) {
    List<TimeKeeperModel> removeKeepers = [];
    for (var timeKeeper in updateTimeNotifiers) {
      final isActive = timeKeeper.update();
      if (isActive == false) {
        removeKeepers.add(timeKeeper);
      }
    }
    for (var timeKeeper in removeKeepers) {
      print("remove");
      removeKeeper(timeKeeper);
    }
  }
}
