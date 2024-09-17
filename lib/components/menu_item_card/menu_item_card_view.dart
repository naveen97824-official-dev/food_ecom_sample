import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/menu_item_card/menu_item_card.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './menu_item_card_view_model.dart';

class MenuItemCardView extends State<MenuItemCard> {
  MenuItemCardViewModel viewModel = MenuItemCardViewModel();
  @override
  void initState() {
    super.initState();
    print(widget.menu);
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Card(
      elevation: 3,
      color: ColorTheme.colorTheme.whiteColor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: ColorTheme.colorTheme.whiteColor,
                  backgroundImage: Image.network(
                          "https://img.freepik.com/free-photo/salad-from-tomatoes-cucumber-red-onions-lettuce-leaves-healthy-summer-vitamin-menu-vegan-vegetable-food-vegetarian-dinner-table-top-view-flat-lay_2829-6482.jpg")
                      .image,
                ),
                Text(
                  widget.menu.name ?? "Fruit salad",
                  style: TextStyle(
                      color: ColorTheme.colorTheme.primaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "N1,200",
                  style: TextStyle(
                      color: ColorTheme.colorTheme.primaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Icon(
              Icons.favorite,
              color: ColorTheme.colorTheme.dangerColor,
            ),
          )
        ],
      ),
    );
  }
}
