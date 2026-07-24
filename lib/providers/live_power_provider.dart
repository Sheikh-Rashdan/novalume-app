import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/meter.dart';
import 'package:novalume_app/models/live_power.dart';

class LivePowerProvider with ChangeNotifier {
  List<LivePower> _livePowerList = [];

  LivePowerProvider() {
    testProviderForLivePowerGraph();
  }

  List<FlSpot> get livePowerSpotList =>
      _livePowerList.map((livePower) => livePower.toFlSpot()).toList();
  double get currentPowerValue =>
      _livePowerList.isNotEmpty ? _livePowerList.last.powerKwh : 0;
  String get currentPowerValueString => currentPowerValue.toStringAsFixed(1);
  String get currentPowerStrainString {
    if (currentPowerValue <
        KMeter.maximumPowerValue * KMeter.powerStrainStops[0]) {
      return "Low";
    } else if (currentPowerValue <
        KMeter.maximumPowerValue * KMeter.powerStrainStops[1]) {
      return "Medium";
    }
    return "High";
  }

  Color get currentPowerStrainColor {
    switch (currentPowerStrainString) {
      case "Low":
        return KColors.greenTextColor;
      case "Medium":
        return KColors.yellowTextColor;
      case "High":
        return KColors.redTextColor;
      default:
        return KColors.whiteTextColor;
    }
  }

  void addLivePower(LivePower livePower) {
    _livePowerList.add(livePower);
    if (_livePowerList.length > KMeter.maximumGraphPoints) {
      _livePowerList.removeRange(
        0,
        _livePowerList.length - KMeter.maximumGraphPoints,
      );
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
    await Future.delayed(Duration(milliseconds: 300));
    resetLivePower();
    if (!_runningTest) {
      _runningTest = true;
      testProviderForLivePowerGraphAddSpots();
    }
  }

  Future<void> testProviderForLivePowerGraphAddSpots() async {
    await Future.delayed(Duration(seconds: KMeter.fetchSeconds));
    addLivePowerWithParameters(
      timeMs: _livePowerList.isNotEmpty ? (_livePowerList.last.timeMs + 1) : 0,
      powerKwh: (3 + Random().nextInt(15) + Random().nextDouble()),
    );
    testProviderForLivePowerGraphAddSpots();
  }
}
