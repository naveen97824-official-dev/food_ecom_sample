import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ecom_sample/image_asset.dart';
import 'package:food_ecom_sample/pages/login_page/login_page.dart';
import 'package:food_ecom_sample/pages/login_page/login_page_view_model.dart';
import 'package:food_ecom_sample/router/router.gr.dart';
import 'package:food_ecom_sample/services/product/product_service.dart';
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
          Expanded(child: tabSection()),
          otherSignSection(),
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
        viewModel.selectedTab == "signIn" ? signInSection() : signUpSection(),
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
      width: MediaQuery.of(context).size.width,
      child: Container(
        alignment: viewModel.selectedTab == "signUp"
            ? Alignment.topRight
            : Alignment.topLeft,
        // alignment: Alignment.topLeft,
        height: 200,
        width: 200,
        child: Image.asset(
          ImageAssets.loginFoodDish,
          fit: BoxFit.cover,
        ),
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
          loginDetailsSection(),
        ],
      ),
    );
  }

  Widget loginDetailsSection() {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Email Address"),
          controller: viewModel.emailController,
          onChanged: (value) {
            viewModel.userDetail.emailId = value;
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
            viewModel.userDetail.password = value;
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
                  viewModel.createNewProduct();
                if (viewModel.validateLoginButton()) {
                  // context.router.push(LandingRoute());
                }
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
    );
  }

  Widget otherSignSection() {
    return Container(
      height: 200,
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  color: ColorTheme.colorTheme.primaryTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("or"),
              ),
              Expanded(
                child: Divider(
                  color: ColorTheme.colorTheme.primaryTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Sign in using; "),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              otherOptionsButton(ImageAssets.google, 30),
              SizedBox(
                width: 14,
              ),
              otherOptionsButton(ImageAssets.facebook, 50),
              SizedBox(
                width: 14,
              ),
              otherOptionsButton(ImageAssets.twitter, 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget otherOptionsButton(String image, double height) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorTheme.colorTheme.primaryTextColor,
            blurRadius: 8.0, // soften the shadow
          ),
        ], shape: BoxShape.circle),
        child: CircleAvatar(
          backgroundColor: ColorTheme.colorTheme.whiteColor,
          child: Image.asset(
            image,
            height: height,
          ),
        ),
      ),
    );
  }

  Widget signUpSection() {
    return Container(
      child: Text("Sign Up"),
    );
  }
}
