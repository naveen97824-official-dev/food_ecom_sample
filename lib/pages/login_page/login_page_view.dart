import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ecom_sample/image_asset.dart';
import 'package:food_ecom_sample/pages/login_page/login_page.dart';
import 'package:food_ecom_sample/pages/login_page/login_page_view_model.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';

class LoginPageView extends State<LoginPage> {
  LoginPageViewModel viewModel = LoginPageViewModel();
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
          child: viewModel.isSignIn ? signInSection() : signUpSection(),
        ),
      ],
    );
  }

  Widget tabMenu(String type, String buttonText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (type == "signIn") {
            viewModel.isSignIn = true;
          } else {
            viewModel.isSignIn = false;
          }
        });
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: ((!viewModel.isSignIn && type == "signUp") ||
                (viewModel.isSignIn && type == "signIn"))
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
              color: ((!viewModel.isSignIn && type == "signUp") ||
                      (viewModel.isSignIn && type == "signIn"))
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
      child: Text("Sign In"),
    );
  }

  Widget signUpSection() {
    return Container(
      child: Text("Sign Up"),
    );
  }
}
