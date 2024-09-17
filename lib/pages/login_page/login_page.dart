import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_ecom_sample/pages/login_page/login_page_view.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageView createState() => LoginPageView();
}
