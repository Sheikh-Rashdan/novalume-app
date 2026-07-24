import 'dart:math';
import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/widgets/gradient_banner_card.dart';
import 'package:novalume_app/widgets/labelled_value.dart';
import 'package:novalume_app/widgets/list_option_builder.dart';
import 'package:novalume_app/widgets/primary_container.dart';
import 'package:novalume_app/widgets/sliver_page_column.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPageColumn(
      appBartitle: "Profile",
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              PrimaryContainer(
                child: Column(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CustomPaint(
                        painter: ProfileDonutPainter(
                          fractions: const [0.7, 0.3],
                          colors: const [KColors.pinkDark, KColors.pinkLight],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelledValue(
                          label: 'Mains',
                          amount: '₹ 1280 / 5000',
                          color: KColors.pinkDark,
                        ),
                        const SizedBox(width: 60),
                        LabelledValue(
                          label: 'Solar',
                          amount: '₹ 3000 / 5000',
                          color: KColors.pinkLight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GradientBannerCard(
                title: 'Your Savings : ₹ 3567',
                subtitle: '+14% this month',
                margin: const EdgeInsets.symmetric(horizontal: 20),
                titleAlignment: CrossAxisAlignment.center,
              ),
              const SizedBox(height: 16),
              ListOptionBuilder(
                labels: [
                  "Personal Info",
                  "Appliances",
                  "Cost Goal",
                  "Comparison",
                ],
                iconDatas: [
                  Icons.info_rounded,
                  Icons.perm_device_info_rounded,
                  Icons.currency_rupee_rounded,
                  Icons.query_stats_rounded,
                ],
                onTaps: [() {}, () {}, () {}, () {}],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileDonutPainter extends CustomPainter {
  const ProfileDonutPainter({required this.fractions, required this.colors});

  final List<double> fractions;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 20.0;
    const gap = 28.0;
    final outerRadius = size.width / 2 - 4;

    for (int i = 0; i < fractions.length; i++) {
      final radius = outerRadius - i * gap;

      final trackPaint = Paint()
        ..color = colors[i].withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final arcPaint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final rect = Rect.fromCircle(center: center, radius: radius);
      canvas.drawCircle(center, radius, trackPaint);
      canvas.drawArc(rect, -pi / 2, 2 * pi * fractions[i], false, arcPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
