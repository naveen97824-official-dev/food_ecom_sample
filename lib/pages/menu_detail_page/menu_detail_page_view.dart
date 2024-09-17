import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/ratings/ratings.dart';
import 'package:food_ecom_sample/models/menu/menu.dart';
import 'package:food_ecom_sample/pages/home_page/home_page.dart';
import 'package:food_ecom_sample/pages/menu_detail_page/menu_detail_page.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './menu_detail_page_view_model.dart';
import 'package:auto_route/auto_route.dart';

class MenuDetailPageView extends State<MenuDetailPage> {
  MenuDetailPageViewModel viewModel = MenuDetailPageViewModel();
  @override
  void initState() {
    super.initState();
    // viewModel.menuDetailList = viewModel.menuDetailJson
    //     .map<Menu>((json) => Menu.fromJson(json))
    //     .toList();
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      backgroundColor: ColorTheme.colorTheme.whiteColor,
      appBar: AppBar(
        shadowColor: ColorTheme.colorTheme.primaryTextColor,
        backgroundColor: ColorTheme.colorTheme.whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    imageSection(),
                    SizedBox(height: 12),
                    menuDetailsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuDetailsSection() {
    return Container(
      child: Column(
        children: <Widget>[
          titleAndReview(),
        ],
      ),
    );
  }

  Widget titleAndReview() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "Fruit salad",
            style: TextStyle(
                color: ColorTheme.colorTheme.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Ratings(),
          Text(
            "(59 ratings)",
            style: TextStyle(
                color: ColorTheme.colorTheme.primaryTextColor, fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget imageSection() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
              "https://media.istockphoto.com/id/998309062/photo/burger-with-beef-and-cheese.jpg?s=1024x1024&w=is&k=20&c=8dsV5BdPbebUGFkWuFenRKeaOe95BEnlcRkPqEo6PxA=",
              fit: BoxFit.cover),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: ColorTheme.colorTheme.whiteColor,
              child: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: ColorTheme.colorTheme.primaryColor,
              ),
            ))
      ],
    );
  }
}
