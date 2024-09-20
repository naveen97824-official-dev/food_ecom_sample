import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_ecom_sample/pages/cart_page/cart_page.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './cart_page_view_model.dart';

class CartPageView extends State<CartPage> {
  CartPageViewModel viewModel = CartPageViewModel();
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      backgroundColor: ColorTheme.colorTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorTheme.colorTheme.whiteColor,
        title: Text("Your order"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                cartItem(),
              ],
            ),
          ),
          cartValueSection(),
        ],
      ),
    );
  }

  Widget cartValueSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorTheme.colorTheme.primaryTextColor,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
          color: ColorTheme.colorTheme.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: <Widget>[
          totalPrice(),
          SizedBox(
            height: 12,
          ),
          checkoutSection(),
        ],
      ),
    );
  }

  Widget checkoutSection() {
    return Column(
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: ColorTheme.colorTheme.primaryColor,
              ),
              backgroundColor: ColorTheme.colorTheme.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          onPressed: () {},
          child: SizedBox(
            width: 150,
            child: Text(
              "Add Items",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorTheme.colorTheme.primaryColor),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: ColorTheme.colorTheme.primaryColor,
              ),
              backgroundColor: ColorTheme.colorTheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          onPressed: () {},
          child: SizedBox(
            width: 150,
            child: Text(
              "Checkout",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorTheme.colorTheme.whiteColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget totalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total price",
          style: TextStyle(fontSize: 18),
        ),
        Column(
          children: <Widget>[
            Text(
              "N1,200",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              "(Delivery fee not included)",
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }

  Widget cartItem() {
    return Card(
      color: ColorTheme.colorTheme.whiteColor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                menuNameSection(),
                quantityAndPriceSection(),
              ],
            ),
          ),
          Positioned(
            top: -8,
            right: -4,
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 12,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget quantityAndPriceSection() {
    return Row(
      children: <Widget>[
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
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "N1,200",
          style: TextStyle(
              color: ColorTheme.colorTheme.primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget menuNameSection() {
    return Row(
      children: <Widget>[
        ClipRRect(
          child: Image.network(
            "https://media.istockphoto.com/id/998309062/photo/burger-with-beef-and-cheese.jpg?s=1024x1024&w=is&k=20&c=8dsV5BdPbebUGFkWuFenRKeaOe95BEnlcRkPqEo6PxA=",
            fit: BoxFit.fill,
            height: 50,
            width: 50,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        SizedBox(
          width: 8,
        ),
        Text("Fruit salad"),
      ],
    );
  }
}
