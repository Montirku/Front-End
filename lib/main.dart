import 'package:flutter/material.dart';
import 'package:montirku_v1/views/initial_display/splash_sreen.dart';
// import 'package:montirku_v1/views/initial_display/welcome_2.dart';
import 'package:montirku_v1/views/user_client/register/register.dart';

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
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Register(),
      },
    );
  }
}
