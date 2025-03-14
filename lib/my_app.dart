import 'package:ArduinoSimulator/pages/connect_device_page.dart';
import 'package:ArduinoSimulator/pages/auth/sign_in.dart';
import 'package:ArduinoSimulator/pages/auth/sign_up.dart';
import 'package:ArduinoSimulator/pages/home_page.dart';
import 'package:ArduinoSimulator/pages/official_cource_page.dart';
import 'package:ArduinoSimulator/pages/profile_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/profile': (context) => const ProfilePage(),
        '/cource/official': (context) => const OfficialCourcePage(),
        '/cource/official/task': (context) => const ConnectDevicePage(),
      },
    );
  }
}
