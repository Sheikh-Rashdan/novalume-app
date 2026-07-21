import 'package:flutter/material.dart';

class KColors {
  static const Color scaffoldColor = Color.fromARGB(255, 244, 241, 231);
  static const Color appbarColor = Color.fromARGB(255, 179, 111, 83);
  static const Color navbarColor = Color.fromARGB(255, 108, 63, 46);

  static const Color navbarUnselectedColor = Color.fromARGB(255, 244, 241, 231);
  static const Color navbarSelectedColor = Color.fromARGB(255, 170, 115, 92);

  static const Color primaryColorLight = appbarColor;
  static const Color primaryColorDark = navbarColor;
  static const List<Color> primaryContainerGradient = [
    primaryColorLight,
    primaryColorDark,
  ];
  static const Color secondaryColorLight = Color.fromARGB(255, 235, 221, 208);
  static const Color secondaryColorDark = Color.fromARGB(255, 151, 123, 123);

  static const Color dividerColor = Color.fromARGB(50, 0, 0, 0);

  static const Color whiteTextColor = Colors.white;
  static const Color blackTextColor = Color.fromARGB(255, 37, 37, 37);
  static const Color redTextColor = Color.fromARGB(255, 211, 75, 75);
  static const Color greenTextColor = Color.fromARGB(255, 95, 178, 79);

  static const Color redStatusColor = Color.fromARGB(255, 197, 69, 69);
  static const Color greenStatusColor = Color.fromARGB(255, 109, 177, 96);

  static const Color greyBgColor = Color.fromARGB(255, 217, 217, 217);
}
