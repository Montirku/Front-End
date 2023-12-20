import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/home/fnearby/2nd_page.dart';

class UnlockMember extends StatelessWidget {
  const UnlockMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341,
      height: 152,
      decoration: ShapeDecoration(
        color: const Color(0xFFA8F8D7),
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
      child: Column(
        children: [
          InkWell(
              onTap: () {
                // Navigasi ke halaman tertentu
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage()));
              },
              child: Image.asset(
                'assets/images/13.jpeg',
                height: 120,
                width: 120,
              )),
          const Text('Nearby')
        ],
      ),
    );
  }
}
