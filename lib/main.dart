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
          selectedLabelStyle: TextStyle(fontSize: 12),
          selectedIconTheme: IconThemeData(size: 28),
          showUnselectedLabels: true,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: KColors.whiteTextColor),
        ),
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
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
        ),
        body: HomePage(),
      ),
    );
  }
}
