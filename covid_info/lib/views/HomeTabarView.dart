import 'package:covid_info/views/homeView/homeView.dart';
import 'package:covid_info/views/searchView/searchView.dart';
import 'package:flutter/material.dart';

import '../utilities/customColors.dart';

class HomeTabBarView extends StatefulWidget {
  const HomeTabBarView({Key? key}) : super(key: key);

  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeView(),
    SearchView(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColor.fromHex("#009688"),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: size.width * 0.065,
              color: Colors.white.withOpacity(0.5),
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              size: size.width * 0.065,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: size.width * 0.065,
              color: Colors.white.withOpacity(0.5),
            ),
            activeIcon: Icon(
              Icons.search,
              size: size.width * 0.065,
              color: Colors.white,
            ),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }
}
