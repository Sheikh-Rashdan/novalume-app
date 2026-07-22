import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/pages/home_page.dart';
import 'package:novalume_app/pages/meter_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Novalume",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KColors.seedColor),
        textTheme: Typography.material2021().white.apply(
          fontFamily: KTextStyles.fontFamily,
          bodyColor: KColors.whiteTextColor,
          displayColor: KColors.whiteTextColor,
        ),
        scaffoldBackgroundColor: KColors.scaffoldColor,
        appBarTheme: AppBarTheme(
          backgroundColor: KColors.appbarColor,
          foregroundColor: KColors.whiteTextColor,
          titleTextStyle: KTextStyles.regular28,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: KColors.navbarColor,
          selectedItemColor: KColors.navbarUnselectedColor,
          unselectedItemColor: KColors.navbarSelectedColor,
          selectedLabelStyle: KTextStyles.medium12,
          selectedIconTheme: IconThemeData(size: 28),
          showUnselectedLabels: true,
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: SegmentedButton.styleFrom(
            backgroundColor: KColors.secondaryColorLight,
            selectedBackgroundColor: KColors.secondaryColorLight,
            foregroundColor: KColors.secondaryColorDark,
            selectedForegroundColor: KColors.brownTextColor,
            textStyle: KTextStyles.medium16,
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: KColors.whiteTextColor),
        ),
      ),
      home: Scaffold(
        bottomNavigationBar: MainBottomNavigationBar(),
        body: HomePage(),
      ),
    );
  }
}

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: "Meter",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_rounded),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "Profile",
        ),
      ],
    );
  }
}
