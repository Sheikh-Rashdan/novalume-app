import 'package:flutter/material.dart';
import 'package:flutter_bubble_chart_plus/flutter_bubble_chart_plus.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/models/appliance.dart';
import 'package:novalume_app/models/recommendation.dart';
import 'package:novalume_app/providers/appliance_provider.dart';
import 'package:novalume_app/providers/recommendation_provider.dart';
import 'package:novalume_app/widgets/secondary_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ApplianceProvider>().testProviderForBubbleChart();
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
        children: [ApplianceBubbleWidget(), RecommendationListView()],
      ),
    );
  }
}

class RecommendationListView extends StatelessWidget {
  const RecommendationListView({super.key});

  void dismissRecommendationTile(
    BuildContext context,
    String recommendationId,
  ) {
    RecommendationProvider recommendationProvider = context
        .read<RecommendationProvider>();
    recommendationProvider.removeRecommendation(recommendationId);
  }

  @override
  Widget build(BuildContext context) {
    RecommendationProvider recommendationProvider = context
        .watch<RecommendationProvider>();
    List<Recommendation> recommendationList =
        recommendationProvider.recommendationList;
    return recommendationList.isNotEmpty
        ? Expanded(
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
                  itemCount: recommendationList.length,
                  itemBuilder: (context, index) {
                    return RecommendationTile(
                      index: index,
                      itemCount: recommendationList.length,
                      recommendation: recommendationList[index],
                      onDismissed: dismissRecommendationTile,
                    );
                  },
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            child: Text(
              "No Recommendations",
              style: KTextStyles.medium22.copyWith(
                color: KColors.blackTextColor,
              ),
            ),
          );
  }
}

class RecommendationTile extends StatelessWidget {
  const RecommendationTile({
    super.key,
    required this.index,
    required this.itemCount,
    required this.recommendation,
    required this.onDismissed,
  });

  final int index;
  final int itemCount;
  final Recommendation recommendation;
  final Function(BuildContext, String) onDismissed;

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
      onDismissed: (DismissDirection direction) {
        onDismissed(context, recommendation.id);
      },
      key: Key(recommendation.id),
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
        child: ListTile(
          title: Text(recommendation.text, style: KTextStyles.regular16),
        ),
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
