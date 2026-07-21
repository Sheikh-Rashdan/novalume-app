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
            spacing: 10,
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
        Column(
          children: [
            ListTile(
              leading: Icon(Icons.energy_savings_leaf_rounded),
              title: Text(
                "Energy",
                style: KTextStyles.medium16.copyWith(
                  color: KColors.blackTextColor,
                ),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
