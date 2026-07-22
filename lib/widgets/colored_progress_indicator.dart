import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';

class ColoredProgressIndicator extends StatelessWidget {
  const ColoredProgressIndicator({
    super.key,
    this.height = 18,
    required this.fraction,
    required this.colors,
    required this.stops,
  });

  final double height;
  final double fraction;
  final List<Color> colors;
  final List<double> stops;

  Color _getContainerColor() {
    for (int i = 0; i < stops.length; i++) {
      if (fraction < stops[i]) {
        return colors[i];
      }
    }
    return colors.last;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: fraction),
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, animatedFraction, child) => SizedBox(
        height: height,
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                color: KColors.neutralBgColor,
                shape: StadiumBorder(),
              ),
            ),
            FractionallySizedBox(
              widthFactor: animatedFraction,
              heightFactor: 1,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                decoration: ShapeDecoration(
                  color: _getContainerColor(),
                  shape: StadiumBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
