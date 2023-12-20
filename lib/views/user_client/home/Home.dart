import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/home/3rd_feature.dart';
import 'package:montirku_v1/views/user_client/home/second_page_nearby.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.00, -0.00),
                end: Alignment(1, 0),
                colors: [Color(0x005DB9E6), Color(0xFF5DB9E6)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Logo2.png'),
                Image.asset('assets/images/notif.png'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const MainFeature(),
          const SizedBox(height: 20),
          const UnlockMember(),
          const SizedBox(height: 20),
          Container(
            width: 341,
            height: 311,
            decoration: ShapeDecoration(
              color: const Color(0xFFB4F8FC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ],
      )),
      // bottomNavigationBar: Navigator(),
    );
  }
}
