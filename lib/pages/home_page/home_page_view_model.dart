import 'package:flutter/material.dart';
import 'package:food_ecom_sample/models/menu/menu.dart';
import 'package:food_ecom_sample/models/menu/product/product.dart';
import 'package:food_ecom_sample/services/product/product_service.dart';
import 'package:food_ecom_sample/store/state/app_state.dart';

import 'package:redux/redux.dart';

class HomePageViewModel {
  TextEditingController searchController = TextEditingController();
  List<String> filterChips = ['meals', 'sides', 'snacks', 'drinks'];
  String selectedChip = 'meals';
  List<Product> productList = [];
  Store<AppState>? tempStore;

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

  getAllProducts() {
    ProductService.shared.getProducts().then((onValue) {
      if (onValue != null) {
        print(onValue);
        productList = onValue;
      } else {
        print("No data found");
      }
    });
  }
}
