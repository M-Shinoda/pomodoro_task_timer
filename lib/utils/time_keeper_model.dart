import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeKeeperProvider = ChangeNotifierProvider(
    (ref) => TimeKeeperModel(const Duration(minutes: 50)));

class TimeKeeperModel extends ChangeNotifier {
  late Duration duration;
  late Duration remainingDuration;
  List<DateTime> startDatetimes = [];
  List<DateTime> endDatetimes = [];
  DateTime? lastStartDatetime;
  DateTime? lastEndDatetime;

  bool isActive = false;

  TimeKeeperModel(Duration endScheduleDuration) {
    remainingDuration = duration = endScheduleDuration;
  }

  void start() {
    if (isActive == true) return;
    isActive = true;
    lastStartDatetime = DateTime.now();
    startDatetimes.add(lastStartDatetime!);
    notifyListeners();
  }

  void stop() {
    if (isActive == false) return;
    isActive = false;
    lastEndDatetime = DateTime.now();
    endDatetimes.add(lastEndDatetime!);
    notifyListeners();
  }

  bool update() {
    print("update");
    Duration tmpDuration = Duration.zero;
    startDatetimes.asMap().entries.map((entry) {
      if (startDatetimes.length == entry.key + 1) return;
      tmpDuration += endDatetimes[entry.key].difference(entry.value);
    });
    tmpDuration += DateTime.now().difference(startDatetimes.last);
    remainingDuration = duration - tmpDuration;
    if (remainingDuration <= Duration.zero) {
      remainingDuration = Duration.zero;
      stop();
    }
    notifyListeners();
    return isActive;
  }
}
