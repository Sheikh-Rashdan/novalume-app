import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/meter.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/providers/live_power_provider.dart';
import 'package:novalume_app/widgets/colored_progress_indicator.dart';
import 'package:novalume_app/widgets/list_option_builder.dart';
import 'package:novalume_app/widgets/primary_container.dart';
import 'package:novalume_app/widgets/secondary_container.dart';
import 'package:novalume_app/widgets/sliver_page_column.dart';
import 'package:provider/provider.dart';

class MeterPage extends StatefulWidget {
  const MeterPage({super.key});

  @override
  State<MeterPage> createState() => _MeterPageState();
}

class _MeterPageState extends State<MeterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPageColumn(
      appBartitle: "Meter",
      children: [
        Consumer<LivePowerProvider>(
          builder: (context, livePowerProvider, child) {
            return PrimaryContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Current Usage", style: KTextStyles.light28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${livePowerProvider.currentPowerValueString} kWh",
                        style: KTextStyles.regular40,
                      ),
                      Text(
                        "${livePowerProvider.currentPowerStrainString} Load",
                        style: KTextStyles.regular22.copyWith(
                          color: livePowerProvider.currentPowerStrainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ColoredProgressIndicator(
                    fraction:
                        livePowerProvider.currentPowerValue /
                        KMeter.maximumPowerValue,
                    colors: [
                      KColors.greenStatusColor,
                      KColors.yellowStatusColor,
                      KColors.redStatusColor,
                    ],
                    stops: KMeter.powerStrainStops,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 20),
        SecondaryContainer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Live Energy Consumption",
                  style: KTextStyles.medium16.copyWith(
                    color: KColors.blackTextColor,
                  ),
                ),
              ),
              LivePowerGraph(),
            ],
          ),
        ),
        SizedBox(height: 16),
        ListOptionBuilder(
          labels: ["Energy", "Savings", "Predictions"],
          iconDatas: [
            Icons.energy_savings_leaf_rounded,
            Icons.currency_rupee_rounded,
            Icons.auto_graph_rounded,
          ],
          onTaps: [() {}, () {}, () {}],
        ),
      ],
    );
  }
}

class LivePowerGraph extends StatelessWidget {
  const LivePowerGraph({super.key});

  @override
  Widget build(BuildContext context) {
    LivePowerProvider livePowerProvider = context.watch<LivePowerProvider>();
    List<FlSpot> livePowerSpotList = livePowerProvider.livePowerSpotList;
    return Container(
      padding: const EdgeInsets.only(right: 30, top: 30),
      height: 240,
      child: LineChart(
        LineChartData(
          minX: livePowerSpotList.isNotEmpty ? livePowerSpotList.first.x : 0,
          maxX: livePowerSpotList.isNotEmpty ? livePowerSpotList.last.x : 0,
          minY: 0,
          maxY: livePowerProvider.spotListpeakY * 1.1,
          lineBarsData: [
            LineChartBarData(
              spots: livePowerSpotList,
              isCurved: true,
              color: KColors.brownActiveColor,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: KColors.brownActiveColor.withAlpha(50),
              ),
            ),
          ],
          gridData: FlGridData(drawVerticalLine: false),
          borderData: FlBorderData(
            border: Border(
              right: BorderSide.none,
              top: BorderSide.none,
              left: BorderSide(
                color: KColors.brownActiveColor.withAlpha(150),
                width: 3,
              ),
              bottom: BorderSide(
                color: KColors.brownActiveColor.withAlpha(150),
                width: 3,
              ),
            ),
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    '${spot.y.toStringAsFixed(2)} kWh',
                    KTextStyles.medium16,
                  );
                }).toList();
              },
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              axisNameSize: 30,
              axisNameWidget: Text(
                "Power (kWh)",
                style: KTextStyles.light12.copyWith(
                  color: KColors.blackTextColor,
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 30,
              axisNameWidget: Text(
                "Time (s)",
                style: KTextStyles.light12.copyWith(
                  color: KColors.blackTextColor,
                ),
              ),
            ),
          ),
        ),
        duration: Duration.zero,
      ),
    );
  }
}
