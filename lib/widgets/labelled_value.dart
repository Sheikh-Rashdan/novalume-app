import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';

class LabelledValue extends StatelessWidget {
  const LabelledValue({
    super.key,
    required this.label,
    required this.amount,
    required this.color,
    this.spacing = 4,
    this.maxWidth = 150,
  });

  final String label;
  final String amount;
  final Color color;
  final double spacing;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          Text(label, style: KTextStyles.bold22.copyWith(color: color)),
          SizedBox(height: spacing),
          Container(
            decoration: ShapeDecoration(color: color, shape: StadiumBorder()),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            child: Text(
              amount,
              style: KTextStyles.bold16.copyWith(color: KColors.whiteTextColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
