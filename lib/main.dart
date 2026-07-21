import 'package:flutter/material.dart';
import 'package:flutter_bubble_chart/flutter_bubble_chart.dart';

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
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        ),
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 108, 63, 46),
          selectedItemColor: Color.fromARGB(255, 216, 207, 207),
          unselectedItemColor: Color.fromARGB(255, 151, 110, 110),
          selectedFontSize: 12,
          showUnselectedLabels: true,
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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 179, 111, 83),
          title: Text(
            "NOVALUME",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 360,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: BubbleChart(
                names: [
                  'Refrigerator',
                  'Air Conditioner',
                  'Microwave',
                  'Geyser',
                  'Washing Machine',
                ],
                values: [5.2, 8.8, 2.1, 8.5, 15.2],
                positiveColor: Colors.brown,
                showBorder: false,
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        "List Tile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      tileColor: Colors.blueGrey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
          backgroundColor: Color.fromARGB(255, 179, 111, 83),
          title: Text(
            "NOVALUME",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  colors: [
                    Color.fromARGB(255, 179, 111, 83),
                    Color.fromARGB(255, 108, 63, 46),
                  ],
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
