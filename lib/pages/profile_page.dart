import 'dart:math';
import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
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
              PrimaryContainer(child: CostGoalDonutChart()),
              const SizedBox(height: 20),
              GradientBannerCard(
                title: 'Your Savings : ₹ 3567',
                subtitle: '+14% this month',
                margin: const EdgeInsets.symmetric(horizontal: 20),
                titleAlignment: CrossAxisAlignment.center,
              ),
              const SizedBox(height: 16),
              ListOptionBuilder(
                labels: ["Personal Info", "Devices", "Cost Goal", "Comparison"],
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

class CostGoalDonutChart extends StatelessWidget {
  const CostGoalDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              amount: '₹ 1280/5000',
              color: KColors.pinkDark,
            ),
            const SizedBox(width: 60),
            LabelledValue(
              label: 'Solar',
              amount: '₹ 3000/5000',
              color: KColors.pinkLight,
            ),
          ],
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

class LabelledValue extends StatelessWidget {
  const LabelledValue({
    super.key,
    required this.label,
    required this.amount,
    required this.color,
  });

  final String label;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: KTextStyles.bold22.copyWith(color: color)),
        const SizedBox(height: 4),
        Container(
          decoration: ShapeDecoration(color: color, shape: StadiumBorder()),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
          child: Text(
            amount,
            style: KTextStyles.bold16.copyWith(color: KColors.whiteTextColor),
          ),
        ),
      ],
    );
  }
}

class GradientBannerCard extends StatelessWidget {
  const GradientBannerCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.child,
    this.margin = const EdgeInsets.all(20),
    this.titleAlignment = CrossAxisAlignment.center,
  });

  final String title;
  final String subtitle;
  final Widget? child;
  final EdgeInsetsGeometry margin;
  final CrossAxisAlignment titleAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: KColors.savingsBannerGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: KColors.defaultShadowColor,
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: titleAlignment,
        children: [
          Text(title, style: KTextStyles.bold28),
          Text(
            subtitle,
            style: KTextStyles.medium16.copyWith(color: KColors.whiteTextColor),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
