import 'package:flutter/material.dart';
import 'package:flutter_bubble_chart_plus/flutter_bubble_chart_plus.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/widgets/secondary_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NovalumeAppBarTitle(),
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
          SizedBox(
            height: 360,
            child: SecondaryContainer(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
          ),
          Expanded(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.transparent, Colors.black],
                stops: [0, 0.1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    KColors.secondaryColorLight,
                    KColors.secondaryColorDark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return RecommendationTile(
                      index: index,
                      itemCount: 12,
                      text: "List Tile $index",
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class NovalumeAppBarTitle extends StatelessWidget {
  const NovalumeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "N"),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsetsGeometry.only(right: 4),
              child: Icon(Icons.lightbulb_rounded),
            ),
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(text: "VALUME"),
        ],
        style: KTextStyles.light28.copyWith(letterSpacing: 5),
      ),
    );
  }
}
