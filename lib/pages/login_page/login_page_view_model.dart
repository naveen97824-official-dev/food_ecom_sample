import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_ecom_sample/models/menu/product/product.dart';
import 'package:food_ecom_sample/models/user/user.dart';
import 'package:food_ecom_sample/services/product/product_service.dart';

class LoginPageViewModel {
  bool isSignIn = true;
  String selectedTab = "signIn";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StreamController loginButtonStreamController = StreamController<bool>();
  List<Product> productList = [];
  User userDetail = User();
  bool validateLoginButton() {
    // if (emailController.text.isNotEmpty &&
    //     passwordController.text.isNotEmpty &&
    //     emailController.text.length > 3) {
    //   return true;
    // } else {
    //   return false;
    // }

    if (userDetail != null &&
        userDetail.emailId != null &&
        userDetail.password != null) {
      return true;
    } else {
      return false;
    }
  }

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

  createNewProduct() {
    Product product = Product(
      id: 1,
      title: "title",
      price: 1.0,
      description: "description",
      category: "category",
      image: "image",
    );
    ProductService.shared.createProduct(product).then((onValue) {
      if (onValue != null) {
        print("Created successfully");
      } else {
        print("error in creation");
      }
    });
  }
}
