import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';

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
