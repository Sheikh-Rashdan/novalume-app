import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/providers/live_power_provider.dart';
import 'package:novalume_app/widgets/colored_progress_indicator.dart';
import 'package:novalume_app/widgets/list_option.dart';
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
        PrimaryContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Usage", style: KTextStyles.light28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("30 KwH", style: KTextStyles.regular40),
                  Text(
                    "Low Load",
                    style: KTextStyles.regular22.copyWith(
                      color: KColors.greenTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ColoredProgressIndicator(
                fraction: 0.3,
                colors: [
                  KColors.greenStatusColor,
                  Colors.orange,
                  KColors.redStatusColor,
                ],
                stops: [0.4, 0.7],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SecondaryContainer(child: LivePowerGraph()),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListOption(
                text: "Energy",
                iconData: Icons.energy_savings_leaf_rounded,
                onTap: () {},
              ),
              ListOption(
                text: "Savings",
                iconData: Icons.currency_rupee_rounded,
                onTap: () {},
              ),
              ListOption(
                text: "Predictions",
                iconData: Icons.auto_graph_rounded,
                onTap: () {},
              ),
            ],
          ),
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
                "Time (ms)",
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
