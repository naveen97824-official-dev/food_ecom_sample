import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ecom_sample/image_asset.dart';
import 'package:food_ecom_sample/pages/login_page/login_page.dart';
import 'package:food_ecom_sample/pages/login_page/login_page_view_model.dart';
import 'package:food_ecom_sample/router/router.gr.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';

class LoginPageView extends State<LoginPage> {
  LoginPageViewModel viewModel = LoginPageViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loginButtonStreamController = StreamController<bool>.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageSection(),
          tabSection(),
        ],
      ),
    );
  }

  Widget tabSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: tabMenu("signIn", "Sign In"),
              ),
              Expanded(
                child: tabMenu("signUp", "Sign Up"),
              )
            ],
          ),
        ),
        Container(
          child: viewModel.selectedTab == "signIn"
              ? signInSection()
              : signUpSection(),
        ),
      ],
    );
  }

  Widget tabMenu(String type, String buttonText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (type == "signIn") {
            viewModel.selectedTab = "signIn";
          } else {
            viewModel.selectedTab = "signUp";
            // viewModel.isSignIn = false;
          }
        });
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: ((viewModel.selectedTab == "signUp" && type == "signUp") ||
                (viewModel.selectedTab == "signIn" && type == "signIn"))
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: ColorTheme.colorTheme.primaryColor, width: 2),
                ),
              )
            : BoxDecoration(),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ((viewModel.selectedTab == "signUp" && type == "signUp") ||
                      (viewModel.selectedTab == "signIn" && type == "signIn"))
                  ? ColorTheme.colorTheme.primaryColor
                  : ColorTheme.colorTheme.primaryLightColor),
        ),
      ),
    );
  }

  Widget imageSection() {
    return Container(
      // alignment: Alignment.topLeft,
      height: 200,
      width: 200,
      child: Image.asset(
        ImageAssets.loginFoodDish,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget signInSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Email Address"),
            controller: viewModel.emailController,
            onChanged: (value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Password"),
            controller: viewModel.passwordController,
            onChanged: (value) {
              // setState(() {});
              viewModel.loginButtonStreamController.add(true);
            },
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<dynamic>(
            stream: viewModel.loginButtonStreamController.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              // TODO: the data is not ready, show a loading indicator
              print(snapshot.data);
              return ElevatedButton(
                onPressed: () {
                  if (viewModel.validateLoginButton())
                    context.router.push(HomeRoute());
                },
                style: ButtonStyle(
                  backgroundColor: viewModel.validateLoginButton()
                      ? WidgetStateProperty.all(
                          ColorTheme.colorTheme.primaryColor)
                      : WidgetStateProperty.all(
                          ColorTheme.colorTheme.primaryLightColor),
                ),
                child: Text("Click me"),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget signUpSection() {
    return Container(
      child: Text("Sign Up"),
    );
  }
}
