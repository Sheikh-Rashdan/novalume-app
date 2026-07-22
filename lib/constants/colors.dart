import 'package:flutter/material.dart';

class KColors {
  static const Color seedColor = Color(0xFF675941);
  static const Color scaffoldColor = Color(0xFFF4F1E7);
  static const Color appbarColor = Color(0xFFB36F53);
  static const Color navbarColor = Color(0xFF6C3F2E);

  static const Color navbarUnselectedColor = Color(0xFFF4F1E7);
  static const Color navbarSelectedColor = Color(0xFFAA735C);

  static const Color primaryColorLight = appbarColor;
  static const Color primaryColorDark = navbarColor;
  static const List<Color> primaryContainerGradient = [
    primaryColorLight,
    primaryColorDark,
  ];
  static const Color secondaryColorLight = Color(0xFFEBDDD0);
  static const Color secondaryColorMedium = Color(0xFFD4C3BD);
  static const Color secondaryColorDark = Color(0xFF977B7B);

  static const Color dividerColor = Color(0x30000000);
  static const Color defaultShadowColor = Color(0x40000000);
  static const Color defaultHighlightColor = Color(0x40FFFFFF);

  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color blackTextColor = Color(0xFF252525);
  static const Color redTextColor = Color(0xFFD34B4B);
  static const Color greenTextColor = Color(0xFF5FB24F);
  static const Color brownTextColor = Color(0xFF6C3F2E);

  static const Color redStatusColor = Color(0xFFC54545);
  static const Color greenStatusColor = Color(0xFF6DB160);

  static const Color neutralBgColor = Color(0xFFD9D9D9);
  static const List<Color> brownBubbles = [
    Color(0xFFCFB1A8),
    Color(0xFFAF8A7E),
    Color(0xFFAC7867),
    Color(0xFF9A583E),
    Color(0xFF614A41),
  ];
}
