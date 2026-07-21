import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/pages/home_page.dart';

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
        fontFamily: KTextStyles.fontFamily,
        scaffoldBackgroundColor: KColors.scaffoldColor,
        appBarTheme: AppBarTheme(backgroundColor: KColors.appbarColor),
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

class SliverPageColumn extends StatelessWidget {
  const SliverPageColumn({
    super.key,
    required this.appBartitle,
    required this.children,
  });

  final String appBartitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            appBartitle,
            style: TextStyle(
              color: KColors.whiteTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(children)),
      ],
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({super.key});

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
      padding: const EdgeInsets.only(left: 10, right: 10),
    );
  }
}
