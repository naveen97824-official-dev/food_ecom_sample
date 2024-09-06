import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_ecom_sample/pages/home_page/home_page_view.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageView createState() => HomePageView();
}
