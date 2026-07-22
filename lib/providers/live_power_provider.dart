import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novalume_app/models/live_power.dart';

class LivePowerProvider with ChangeNotifier {
  List<LivePower> _livePowerList = [];

  LivePowerProvider() {
    for (int i = 0; i < 30; i++) {
      addLivePowerWithParameters(
        timeMs: i.toDouble(),
        powerKwh: Random().nextDouble() + 0.5,
      );
    }
  }

  List<FlSpot> get livePowerSpotList =>
      _livePowerList.map((livePower) => livePower.toFlSpot()).toList();

  void addLivePower(LivePower livePower) {
    _livePowerList.add(livePower);
    notifyListeners();
  }

  void addLivePowerWithParameters({
    required double timeMs,
    required double powerKwh,
  }) {
    addLivePower(LivePower(timeMs: timeMs, powerKwh: powerKwh));
  }

  void clearLivePower() {
    _livePowerList.clear();
    notifyListeners();
  }
}
