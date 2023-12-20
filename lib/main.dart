import 'package:flutter/material.dart';
import 'package:montirku_v1/views/initial_display/splash_sreen.dart';
import 'package:montirku_v1/views/user_client/login/onboard.dart';
// import 'package:montirku_v1/views/navigator.dart';
// import 'package:montirku_v1/views/user_client/feature_on_head/fhome_services/detail_bengkelv6.dart';
// import 'package:montirku_v1/views/user_client/feature/fnearby/second_page.dart';
// import 'package:montirku_v1/views/user_client/home/Home.dart';
// import 'package:montirku_v1/views/initial_display/welcome_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const OnboardingScreen()
      },
    );
  }
}
