import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:school_project/providers/dashboard_provider.dart';
import 'package:school_project/providers/feed_provider.dart';
import 'package:school_project/providers/registeration_provider.dart';
import 'package:school_project/screens/dashboard.dart';
import 'package:school_project/utils/global_context.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? spPreferences;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      spPreferences = await SharedPreferences.getInstance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => DashBoardProvider()),
        ChangeNotifierProvider(create: (ctx) => RegistrationProvider()),
        ChangeNotifierProvider(create: (ctx) => FeedProvider()),
      ],
      child: NeumorphicApp(
        title: 'The Kids File',
        themeMode: ThemeMode.light,
        navigatorKey: NavigationService.navigatorKey,
        builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScaleFactor: 1.2,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
            home: const DashBoardScreen(),
      ),
    );
  }
}
