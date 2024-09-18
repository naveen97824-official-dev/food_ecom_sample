import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/ratings/ratings.dart';
import 'package:food_ecom_sample/components/recommended_card/recommended_card.dart';
import 'package:food_ecom_sample/components/review_and_rating_card/review_and_rating_card.dart';
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    imageSection(),
                    SizedBox(height: 12),
                    menuDetailsSection(),
                    Divider(),
                    recommendedSection(),
                    SizedBox(height: 6),
                    Divider(),
                    ratingAndReviewSection(),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            footerCartSection(),
          ],
        ),
      ),
    );
  }

  Widget footerCartSection() {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.colorTheme.whiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorTheme.colorTheme.primaryTextColor,
            blurRadius: 6.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total: N1200",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorTheme.colorTheme.primaryTextColor),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorTheme.colorTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: ColorTheme.colorTheme.whiteColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Add to cart",
                      style: TextStyle(color: ColorTheme.colorTheme.whiteColor))
                ],
              ))
        ],
      ),
    );
  }

  Widget ratingAndReviewSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Ratings & reviews",
                style: TextStyle(
                    color: ColorTheme.colorTheme.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "See all",
                style: TextStyle(color: ColorTheme.colorTheme.primaryColor),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          overallRating(),
          SizedBox(
            height: 8,
          ),
          ReviewAndRatingCard(),
        ],
      ),
    );
  }

  Widget overallRating() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: ColorTheme.colorTheme.primaryColor)),
            child: Text(
              "4.5/5",
              style: TextStyle(
                  color: ColorTheme.colorTheme.primaryColor, fontSize: 10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "(59 ratings)",
            style: TextStyle(
                color: ColorTheme.colorTheme.primaryTextColor, fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget recommendedSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Recommended sides",
            style: TextStyle(
                color: ColorTheme.colorTheme.primaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: <Widget>[RecommendedCard()],
            ),
          )
        ],
      ),
    );
  }

  Widget menuDetailsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleAndReview(),
          SizedBox(height: 8),
          priceAndQuantity(),
          SizedBox(height: 8),
          description(),
        ],
      ),
    );
  }

  Widget priceAndQuantity() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "N1,200",
            style: TextStyle(
                color: ColorTheme.colorTheme.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Container(
            width: 70,
            decoration: BoxDecoration(
              color: ColorTheme.colorTheme.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "-",
                  style: TextStyle(
                      fontSize: 20, color: ColorTheme.colorTheme.whiteColor),
                ),
                Text(
                  "1",
                  style: TextStyle(
                      fontSize: 16, color: ColorTheme.colorTheme.whiteColor),
                ),
                Text(
                  "+",
                  style: TextStyle(
                      fontSize: 16, color: ColorTheme.colorTheme.whiteColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget description() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Description",
          style: TextStyle(
              color: ColorTheme.colorTheme.primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
          softWrap: true,
          style: TextStyle(
            color: ColorTheme.colorTheme.primaryTextColor,
            fontSize: 16,
          ),
        )
      ],
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
          SizedBox(
            width: 10,
          ),
          Ratings(),
          SizedBox(
            width: 4,
          ),
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
