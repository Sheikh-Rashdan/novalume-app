import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
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
        scaffoldBackgroundColor: KColors.scaffoldColor,
        appBarTheme: AppBarTheme(backgroundColor: KColors.appbarColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 108, 63, 46),
          selectedItemColor: Color.fromARGB(255, 244, 241, 231),
          unselectedItemColor: Color.fromARGB(255, 170, 115, 92),
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

class PageView extends StatelessWidget {
  const PageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "NOVALUME",
            style: TextStyle(
              color: KColors.whiteTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle_outline_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_rounded),
            ),
          ],
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
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
              height: 200,
            ),
          ]),
        ),
      ],
    );
  }
}
