import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';

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
