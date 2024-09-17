import 'package:flutter/material.dart';
import 'package:food_ecom_sample/pages/home_page/home_page.dart';
import 'package:food_ecom_sample/pages/landing_page/landing_page.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './landing_page_view_model.dart';

class LandingPageView extends State<LandingPage> {
  LandingPageViewModel viewModel = LandingPageViewModel();
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorTheme.colorTheme.whiteColor,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedItemColor: ColorTheme.colorTheme.primaryColor,
        showSelectedLabels: true,
        selectedLabelStyle:
            TextStyle(color: ColorTheme.colorTheme.primaryColor),
        unselectedItemColor: ColorTheme.colorTheme.primaryLightColor,
        showUnselectedLabels: true,
        unselectedLabelStyle:
            TextStyle(color: ColorTheme.colorTheme.primaryLightColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Live chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      body: switchCase(selectedIndex.toString()),
    );
  }

  Widget switchCase(String value) {
    switch (value) {
      case '0':
        return Text('Live chat');
      case '1':
        return Text('Profile');
      case '2':
        return HomePage();
      case '3':
        return Text('Menu');
      case '4':
        return Text('Favorites');
      default:
        return Text('Live chat');
    }
  }
}
