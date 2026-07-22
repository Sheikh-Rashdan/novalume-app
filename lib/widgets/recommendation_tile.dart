import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';

class RecommendationTile extends StatelessWidget {
  const RecommendationTile({
    super.key,
    required this.index,
    required this.itemCount,
    required this.text,
  });

  final int index;
  final int itemCount;
  final String text;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin;
    if (index == 0) {
      margin = const EdgeInsets.only(top: 25, bottom: 5, left: 12, right: 12);
    } else if (index == itemCount - 1) {
      margin = const EdgeInsets.only(top: 5, bottom: 25, left: 12, right: 12);
    } else {
      margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    }

    return Dismissible(
      key: Key(text + index.toString()),
      child: Container(
        margin: margin,
        decoration: ShapeDecoration(
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: KColors.defaultShadowColor,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
            BoxShadow(color: KColors.neutralBgColor),
            BoxShadow(
              color: KColors.defaultHighlightColor,
              offset: Offset(0, -9),
              blurRadius: 4,
            ),
          ],
        ),
        child: ListTile(title: Text(text, style: KTextStyles.regular16)),
      ),
    );
  }
}
