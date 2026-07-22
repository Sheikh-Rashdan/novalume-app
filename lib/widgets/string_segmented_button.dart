import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';

class StringSegmentedButton extends StatelessWidget {
  const StringSegmentedButton({
    super.key,
    required this.selectedString,
    required this.onSelectionChanged,
    required this.options,
  });

  final String selectedString;
  final ValueChanged<String> onSelectionChanged;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        shadows: [
          BoxShadow(color: KColors.secondaryColorLight),
          BoxShadow(
            color: KColors.defaultShadowColor,
            blurRadius: 8,
            spreadRadius: -6,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: SegmentedButton<String>(
        showSelectedIcon: false,
        segments: options
            .map(
              (option) => ButtonSegment(
                value: option,
                label: selectedString == option
                    ? ButtonSegmentSelectedChip(label: option)
                    : Text(option),
              ),
            )
            .toList(),
        selected: {selectedString},
        onSelectionChanged: (Set<String> value) {
          onSelectionChanged(value.first);
        },
      ),
    );
  }
}

class ButtonSegmentSelectedChip extends StatelessWidget {
  const ButtonSegmentSelectedChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: KColors.secondaryColorMedium,
        shape: StadiumBorder(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Text(label),
    );
  }
}
