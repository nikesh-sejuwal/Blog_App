import 'package:flutter/material.dart';

import 'page_search/Second_Page.dart';
import 'Third_Page.dart';
import 'page_home/First_Page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  int selected_index = 0;

  final List<Widget> screen = [
    First_Page(),
    Second_Page(),
    Third_Page(),
  ];

  void ChangeonTap(int index) {
    setState(() {
      selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {}, icon: Icon(Icons.menu, color: Colors.white)),
      // ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: screen[selected_index],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromARGB(255, 11, 4, 4),
        currentIndex: selected_index,
        onTap: ChangeonTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }
}
