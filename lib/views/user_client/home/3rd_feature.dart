import 'package:flutter/material.dart';

import '../feature_on_head/fhome_services/home_service_pagev2.dart';

class MainFeature extends StatelessWidget {
  const MainFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341,
      height: 120,
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
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigasi ke halaman tertentu
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TargetPage()));
                  },
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/booking3.png'),
                    ),
                  ),
                ),
                const Text('Booking'),
                const Text('Services'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigasi ke halaman tertentu
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeServicePage()));
                  },
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/images/homeService.png'),
                    ),
                  ),
                ),
                const Text('Home'),
                const Text('Services')
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigasi ke halaman tertentu
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TargetPage()));
                  },
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/images/an chattinng.png'),
                    ),
                  ),
                ),
                const Text('Chat'),
                const Text('Montir'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
