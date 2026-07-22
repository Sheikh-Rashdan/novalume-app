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
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: KColors.whiteTextColor),
        ),
      ),
      home: WidgetTree(),
    );
  }
}

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  final List<Widget> pages = const [
    HomePage(),
    MeterPage(),
    Text("Dashboard"),
    Text("Profile"),
  ];

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int _currentPageIndex = 0;

  void _onNavigationBarTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _onNavigationBarTap,
      ),
      body: widget.pages[_currentPageIndex],
    );
  }
}

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
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
