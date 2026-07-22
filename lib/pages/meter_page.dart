import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/icon_styles.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/widgets/colored_progress_indicator.dart';
import 'package:novalume_app/widgets/list_option.dart';
import 'package:novalume_app/widgets/primary_container.dart';
import 'package:novalume_app/widgets/secondary_container.dart';
import 'package:novalume_app/widgets/sliver_page_column.dart';
import 'package:novalume_app/widgets/string_segmented_button.dart';

class MeterPage extends StatefulWidget {
  const MeterPage({super.key});

  final List<String> graphTimePeriodOptions = const ["Day", "Week", "Month"];

  @override
  State<MeterPage> createState() => _MeterPageState();
}

class _MeterPageState extends State<MeterPage> {
  late String _graphTimePeriodString;

  @override
  void initState() {
    _graphTimePeriodString = widget.graphTimePeriodOptions.first;
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
        SizedBox(height: 16),
        SecondaryContainer(
          child: Text(
            "Graph Here",
            style: KTextStyles.bold28.copyWith(color: KColors.blackTextColor),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StringSegmentedButton(
            selectedString: _graphTimePeriodString,
            onSelectionChanged: (String value) {
              setState(() {
                _graphTimePeriodString = value;
              });
            },
            options: widget.graphTimePeriodOptions,
          ),
        ),
        SizedBox(height: 10),
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
