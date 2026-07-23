import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/icon_styles.dart';
import 'package:novalume_app/constants/text_styles.dart';

class ListOptionBuilder extends StatelessWidget {
  const ListOptionBuilder({
    super.key,
    required this.labels,
    required this.iconDatas,
    required this.onTaps,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  }) : assert(
         labels.length == iconDatas.length && labels.length == onTaps.length,
       );

  final List<String> labels;
  final List<IconData> iconDatas;
  final List<VoidCallback> onTaps;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: List.generate(
          labels.length,
          (index) => ListOption(
            label: labels[index],
            iconData: iconDatas[index],
            onTap: onTaps[index],
          ),
        ),
      ),
    );
  }
}

class ListOption extends StatelessWidget {
  const ListOption({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
  });

  final String label;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  iconData,
                  size: KIconStyles.default22,
                  color: KColors.blackTextColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    child: Text(
                      label,
                      style: KTextStyles.medium16.copyWith(
                        color: KColors.blackTextColor,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 22,
                  color: KColors.blackTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
        Divider(thickness: 2, color: KColors.dividerColor),
      ],
    );
  }
}
