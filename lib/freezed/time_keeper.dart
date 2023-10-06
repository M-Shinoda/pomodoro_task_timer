// user.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'time_keeper.freezed.dart';

@freezed
abstract class TimeKeeperModel implements _$TimeKeeperModel {
  // late Duration duration;
  // late Duration remainingDuration;
  // List<DateTime> startDatetimes = [];
  // List<DateTime> endDatetimes = [];
  // DateTime? lastStartDatetime;
  // DateTime? lastEndDatetime;
  const factory TimeKeeperModel(
      {required Duration duration,
      required Duration remainingDuration,
      required List<DateTime> startDatetimes,
      required List<DateTime> endDatetimes,
      required DateTime? lastStartDatetime,
      required DateTime? lastEndDatetime,
      @Default(false) bool isActive}) = _TimeKeeperModel;

  factory TimeKeeperModel.create({required Duration endScheduleDuration}) =>
      TimeKeeperModel(
          duration: endScheduleDuration,
          remainingDuration: endScheduleDuration,
          startDatetimes: [],
          endDatetimes: [],
          lastStartDatetime: null,
          lastEndDatetime: null);
}

// class TimeKeeperModel extends ChangeNotifier {
//   bool isActive = false;

//   TimeKeeperModel() {
//     remainingDuration = duration = endScheduleDuration;
//   }
//    void start() {
//     if (isActive == true) return;
//     isActive = true;
//     lastStartDatetime = DateTime.now();
//     startDatetimes.add(lastStartDatetime!);
//     notifyListeners();
//   }

//   void stop() {
//     if (isActive == false) return;
//     isActive = false;
//     lastEndDatetime = DateTime.now();
//     endDatetimes.add(lastEndDatetime!);
//     notifyListeners();
//   }

//   bool update() {
//     print("update");
//     Duration tmpDuration = Duration.zero;
//     startDatetimes.asMap().entries.map((entry) {
//       if (startDatetimes.length == entry.key + 1) return;
//       tmpDuration += endDatetimes[entry.key].difference(entry.value);
//     });
//     tmpDuration += DateTime.now().difference(startDatetimes.last);
//     remainingDuration = duration - tmpDuration;
//     if (remainingDuration <= Duration.zero) {
//       remainingDuration = Duration.zero;
//       stop();
//     }
//     notifyListeners();
//     return isActive;
//   }
// }
