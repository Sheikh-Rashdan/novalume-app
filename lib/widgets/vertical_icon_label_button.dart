import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerticalIconLabelButton extends StatelessWidget {
  const VerticalIconLabelButton({
    super.key,
    this.icon,
    this.faIcon,
    required this.text,
    required this.onTap,
    this.spacing = 8,
  }) : assert(icon != null || faIcon != null);

  final Icon? icon;
  final FaIcon? faIcon;
  final Widget text;
  final VoidCallback onTap;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon == null ? faIcon! : icon!,
            SizedBox(height: spacing),
            text,
          ],
        ),
      ),
    );
  }
}
