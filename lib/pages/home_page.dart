import 'package:flutter/material.dart';
import 'package:flutter_bubble_chart_plus/flutter_bubble_chart_plus.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/models/appliance.dart';
import 'package:novalume_app/providers/appliance_provider.dart';
import 'package:novalume_app/widgets/recommendation_tile.dart';
import 'package:novalume_app/widgets/secondary_container.dart';
import 'package:provider/provider.dart';

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
          ApplianceBubbleWidget(),
          TextButton(
            onPressed: () {
              context.read<ApplianceProvider>().addApplianceWithParameters(
                "Rashdan",
                1.2,
              );
            },
            child: Text("add"),
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

class ApplianceBubbleWidget extends StatelessWidget {
  const ApplianceBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ApplianceProvider applianceProvider = context.watch<ApplianceProvider>();
    List<Appliance> applianceList = applianceProvider.topAppliances;
    return SizedBox(
      height: 360,
      child: SecondaryContainer(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
        child: BubbleChart(
          names: applianceList.map((appliance) => appliance.name).toList(),
          values: applianceList.map((appliance) => appliance.powerKwh).toList(),
          colors: KColors.brownBubbles
              .getRange(0, applianceList.length)
              .toList(),
          showBorder: false,
          showValues: false,
        ),
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
