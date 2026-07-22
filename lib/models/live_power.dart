import 'package:fl_chart/fl_chart.dart';

class LivePower {
  double timeMs;
  double powerKwh;

  LivePower({required this.timeMs, required this.powerKwh});

  FlSpot toFlSpot() {
    return FlSpot(timeMs, powerKwh);
  }
}
