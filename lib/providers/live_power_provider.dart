import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novalume_app/models/live_power.dart';

class LivePowerProvider with ChangeNotifier {
  List<LivePower> _livePowerList = [];
  final int maximumElements = 50;

  LivePowerProvider() {
    for (int i = 0; i < 30; i++) {
      addLivePowerWithParameters(
        timeMs: i.toDouble(),
        powerKwh: Random().nextDouble() + 0.5,
      );
    }
    testProviderForLivePowerGraph();
  }

  List<FlSpot> get livePowerSpotList =>
      _livePowerList.map((livePower) => livePower.toFlSpot()).toList();

  void addLivePower(LivePower livePower) {
    _livePowerList.add(livePower);
    if (_livePowerList.length > maximumElements) {
      _livePowerList.removeRange(0, _livePowerList.length - maximumElements);
    }
    notifyListeners();
  }

  void addLivePowerWithParameters({
    required double timeMs,
    required double powerKwh,
  }) {
    addLivePower(LivePower(timeMs: timeMs, powerKwh: powerKwh));
  }

  void resetLivePower() {
    _livePowerList.clear();
    notifyListeners();
  }

  bool _runningTest = false;
  Future<void> testProviderForLivePowerGraph() async {
    await Future.delayed(Duration(seconds: 1));
    resetLivePower();
    if (!_runningTest) {
      _runningTest = true;
      testProviderForLivePowerGraphAddSpots();
    }
  }

  Future<void> testProviderForLivePowerGraphAddSpots() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(90) + 10));
    addLivePowerWithParameters(
      timeMs: _livePowerList.isNotEmpty ? (_livePowerList.last.timeMs + 1) : 0,
      powerKwh: Random().nextDouble() + 0.5,
    );
    testProviderForLivePowerGraphAddSpots();
  }
}
