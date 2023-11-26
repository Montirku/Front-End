import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/Home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
      title: 'Shop All You Want',
      description: 'Description 1',
      image: 'assets/1.jpeg',
    ),
    WelcomeSlider(
      title: 'Save time, Order Online',
      description: 'Convenience at your fingertips',
      image: 'assets/2.jpeg',
    ),
    WelcomeSlider(
      title: 'The Great Shop Journey',
      description: 'Make a practical choice with voice',
      image: 'assets/3.jpg',
    ),
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
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: welcomeSlider.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = welcomeSlider[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Image.asset(
                              item.image,
                              height: 300,
                              width: 300,
                            ),
                          ),
                          Text(
                            item.title,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                          ),
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 95, 92, 92),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(welcomeSlider.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Color(0xFF52CBAC)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF52CBAC),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // Sesuaikan dengan kebutuhan
                  ),
                  elevation: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 11),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF008BD0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // Sesuaikan dengan kebutuhan
                  ),
                  elevation: 20,
                ),
                onPressed: () {
                  if (_currentPage < welcomeSlider.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 11),
                  child: _currentPage != welcomeSlider.length - 1
                      ? const Text("Next")
                      : const Icon(Icons.done),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeSlider {
  final String title;
  final String description;
  final String image;

  WelcomeSlider({
    required this.title,
    required this.description,
    required this.image,
  });
}
