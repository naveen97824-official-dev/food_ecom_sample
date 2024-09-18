import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/recommended_card/recommended_card.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './recommended_card_view_model.dart';

class RecommendedCardView extends State<RecommendedCard> {
  RecommendedCardViewModel viewModel = RecommendedCardViewModel();
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Card(
      color: ColorTheme.colorTheme.whiteColor,
      child: SizedBox(
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                "https://media.istockphoto.com/id/168731372/photo/fresh-homemade-chocolate-brownie.jpg?s=612x612&w=0&k=20&c=DOWddwc5EBO7gedFIL7SC5absmtACBOefRRc8YLyh-w=",
                fit: BoxFit.fill,
                height: 120,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text("Brownie"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "N 1,000",
                    style: TextStyle(
                        color: ColorTheme.colorTheme.primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: ColorTheme.colorTheme.primaryColor,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: ColorTheme.colorTheme.whiteColor,
                      child: Icon(
                        Icons.add,
                        color: ColorTheme.colorTheme.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
