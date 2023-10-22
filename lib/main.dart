import 'package:device_preview/device_preview.dart';
import 'package:donor_mobile_app/screens/blood_camp.dart';
import 'package:donor_mobile_app/screens/emergency.dart';
import 'package:donor_mobile_app/screens/help.dart';
import 'package:donor_mobile_app/screens/history.dart';
import 'package:donor_mobile_app/screens/landing_page.dart';
import 'package:donor_mobile_app/screens/rewards.dart';
import 'package:donor_mobile_app/screens/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Signika',
      ),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routes: {
        '/emergency': (context) => const Emergency(),
        '/help': (context) => const HELP(),
        '/blood_camp': (context) => const BLOOD_CAMP(),
        '/rewards': (context) => const REWARDS(),
        '/history': (context) => const HISTORY(),
        '/setting': (context) => const SETTING(),
      },
      home: const LandingPage(),
      //home: const AppBarApp(),
    );
  }
}
