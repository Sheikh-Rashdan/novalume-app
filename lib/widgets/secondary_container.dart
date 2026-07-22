import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';

class SecondaryContainer extends StatelessWidget {
  const SecondaryContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
      padding: padding ?? const EdgeInsets.all(10),
      child: child,
    );
  }
}
