//versi ori
import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/Home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  int _curentPage = 0;
  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: 'Shop All You Want',
        description: ' description',
        image: 'assets/Logo.jpeg'),
    WelcomeSlider(
        title: 'Save time, Order Online',
        description: 'Convience at your fingertips',
        image: 'assets/Logo.jpeg'),
    WelcomeSlider(
        title: 'The Greate Shop Journey',
        description: 'Make a practical choice with voice',
        image: 'assets/Logo.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE8FCFA),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: welcomeSlider.length,
                    onPageChanged: (value) {
                      setState(() {
                        _curentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = welcomeSlider[index];
                      return Column(
                        children: [
                          Image.asset(
                            item.image,
                            height: 350,
                            width: 350,
                          ),
                          Text(
                            item.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                          ),
                          Text(
                            item.description,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 95, 92, 92),
                                fontSize: 20),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: List.generate(welcomeSlider.length, (index) {
                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 10,
                          width: _curentPage == index ? 30 : 10,
                          decoration: BoxDecoration(
                              color: _curentPage == index
                                  ? Colors.red
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                        ));
                  }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            if (_curentPage < welcomeSlider.length) {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 113),
                  curve: Curves.easeOut);
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            }
          },
          child: _curentPage != welcomeSlider.length - 1
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.done),
        ),
      ),
    );
  }
}

class WelcomeSlider {
  final String title;
  final String description;
  final String image;
  WelcomeSlider(
      {required this.title, required this.description, required this.image});
}
