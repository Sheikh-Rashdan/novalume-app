import 'package:flutter/material.dart';
import 'package:flutter_bubble_chart_plus/flutter_bubble_chart_plus.dart';
import 'package:novalume_app/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded)),
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
              values: [2.5, 5, 7.5, 10, 12.5],
              colors: KColors.brownBubbles,
              showBorder: false,
              showValues: false,
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        "List Tile $index",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      tileColor: KColors.neutralBgColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
