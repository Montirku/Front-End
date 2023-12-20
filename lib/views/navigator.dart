import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/home/Home.dart';
import 'package:montirku_v1/views/user_client/feature_on_navbar/farticle/article.dart';
import 'package:montirku_v1/views/user_client/feature_on_navbar/favorite.dart';
import 'package:montirku_v1/views/user_client/home/fnearby/2nd_page.dart';
import 'package:montirku_v1/views/user_client/feature_on_navbar/profile.dart';

class MyNavigator extends StatefulWidget {
  const MyNavigator({Key? key});

  @override
  State<MyNavigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<MyNavigator> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SecondPage(),
    const ArticlePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on, color: Colors.black),
              label: 'Nearby',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article, color: Colors.black),
              label: 'Article',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
