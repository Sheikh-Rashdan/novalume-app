import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/widgets/colored_progress_indicator.dart';
import 'package:novalume_app/widgets/primary_container.dart';
import 'package:novalume_app/widgets/sliver_page_column.dart';

class MeterPage extends StatelessWidget {
  const MeterPage({super.key});

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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(64)),
              BoxShadow(
                color: KColors.secondaryColorLight,
                offset: Offset(0, 2),
                blurRadius: 7,
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          child: Text(
            "Graph Here",
            style: KTextStyles.bold28.copyWith(color: KColors.blackTextColor),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SegmentedButton<String>(
            onSelectionChanged: (Set<String> value) {},
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: "day",
                label: Container(
                  decoration: ShapeDecoration(
                    color: KColors.secondaryColorMedium,
                    shape: StadiumBorder(),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  child: Text("Day"),
                ),
              ),
              ButtonSegment(value: "week", label: Text("Week")),
              ButtonSegment(value: "month", label: Text("Month")),
            ],
            selected: {"day"},
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

class ListOption extends StatelessWidget {
  const ListOption({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  final String text;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(iconData, size: 22, color: KColors.blackTextColor),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    child: Text(
                      text,
                      style: KTextStyles.medium16.copyWith(
                        color: KColors.blackTextColor,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 22,
                  color: KColors.blackTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
        Divider(thickness: 2, color: KColors.dividerColor),
      ],
    );
  }
}
