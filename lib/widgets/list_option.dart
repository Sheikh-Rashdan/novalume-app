import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/icon_styles.dart';
import 'package:novalume_app/constants/text_styles.dart';

class ListOption extends StatelessWidget {
  const ListOption({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  final String text;
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
                // Icon(iconData, size: 22, color: KColors.blackTextColor),
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
                      text,
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
