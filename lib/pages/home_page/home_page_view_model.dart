import 'package:flutter/material.dart';
import 'package:food_ecom_sample/models/menu/menu.dart';

class HomePageViewModel {
  TextEditingController searchController = TextEditingController();
  List<String> filterChips = ['meals', 'sides', 'snacks', 'drinks'];
  String selectedChip = 'meals';


  dynamic menuDetailJson = [
    {
      "avatar":
          "https://img.freepik.com/free-photo/salad-from-tomatoes-cucumber-red-onions-lettuce-leaves-healthy-summer-vitamin-menu-vegan-vegetable-food-vegetarian-dinner-table-top-view-flat-lay_2829-6482.jpg",
      "name": "Fruit Salad cream",
      "price": 8.99,
      "isFav": false
    },
    {
      "avatar":
          "https://img.freepik.com/free-photo/salad-from-tomatoes-cucumber-red-onions-lettuce-leaves-healthy-summer-vitamin-menu-vegan-vegetable-food-vegetarian-dinner-table-top-view-flat-lay_2829-6482.jpg",
      "name": "Fruit Salad",
      "price": 8.99,
      "isFav": false
    }
  ];

  List<Menu> menuList = [];

}
