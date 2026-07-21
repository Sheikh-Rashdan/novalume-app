import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: KColors.primaryContainerGradient,
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
      child: child,
    );
  }
}
