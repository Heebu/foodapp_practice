import 'package:flutter/material.dart';
import 'package:foodapp_practice/Home/home.dart';
import 'package:foodapp_practice/Home/search_page.dart';
import 'package:foodapp_practice/Home/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

PageController pageController = PageController();
Color indicatorColor = Colors.grey;
int _currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            Home(),
            SearchPage(),
            Settings(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: Colors.white12,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.white54,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        ),
      ),
    );
  }
}
