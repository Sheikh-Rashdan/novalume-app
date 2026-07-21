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
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: KColors.greyBgColor,
              shape: StadiumBorder(),
            ),
          ),
          FractionallySizedBox(
            widthFactor: fraction,
            heightFactor: 1,
            child: Container(
              decoration: ShapeDecoration(
                color: _getContainerColor(),
                shape: StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
