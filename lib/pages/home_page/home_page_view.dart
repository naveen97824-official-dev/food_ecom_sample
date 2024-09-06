import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_ecom_sample/pages/home_page/home_page.dart';
import 'package:food_ecom_sample/pages/home_page/home_page_view_model.dart';

class HomePageView extends State<HomePage> {
  HomePageViewModel viewModel = HomePageViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Welcome to homePage"),
          ElevatedButton(
              onPressed: () {
                context.router.pop();
              },
              child: Text("Go to Login Page")),
        ],
      ),
    );
  }
}
