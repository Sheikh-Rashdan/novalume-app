import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
import 'package:novalume_app/pages/home_page.dart';
import 'package:novalume_app/pages/login_page.dart';
import 'package:novalume_app/pages/meter_page.dart';
import 'package:novalume_app/providers/appliance_provider.dart';
import 'package:novalume_app/providers/live_power_provider.dart';
import 'package:novalume_app/providers/recommendation_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

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
            selectedForegroundColor: KColors.whiteTextColor,
            splashFactory: NoSplash.splashFactory,
            textStyle: KTextStyles.medium16,
            side: BorderSide.none,
            padding: const EdgeInsets.only(top: 6, bottom: 8),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: KColors.whiteTextColor),
        ),
      ),
      initialRoute: '/main',
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => const WidgetTree(),
      },
    );
  }
}

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int _currentPageIndex = 0;
  late final List<Widget> _pages = [
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApplianceProvider()),
        ChangeNotifierProvider(create: (context) => RecommendationProvider()),
      ],
      child: HomePage(),
    ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LivePowerProvider()),
      ],
      child: MeterPage(),
    ),
    Text("Dashboard"),
    Text("Profile"),
  ];

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
      body: IndexedStack(index: _currentPageIndex, children: _pages),
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
