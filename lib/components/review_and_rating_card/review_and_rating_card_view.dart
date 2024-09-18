import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/ratings/ratings.dart';
import 'package:food_ecom_sample/components/review_and_rating_card/review_and_rating_card.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './review_and_rating_card_view_model.dart';

class ReviewAndRatingCardView extends State<ReviewAndRatingCard> {
  ReviewAndRatingCardViewModel viewModel = ReviewAndRatingCardViewModel();
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Card(
      elevation: 3,
      color: ColorTheme.colorTheme.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            titleRatingAndDate(),
            Text(
              "We loved the food here and the service was awesome. Highly recommended!!",
              softWrap: true,
              style: TextStyle(
                  color: ColorTheme.colorTheme.primaryLightColor, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget titleRatingAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            Ratings(),
            SizedBox(
              height: 4,
            ),
            Text(
              "Awesome Food",
              style: TextStyle(
                color: ColorTheme.colorTheme.primaryTextColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          "18-Sep-2024",
          style: TextStyle(
              color: ColorTheme.colorTheme.primaryLightColor, fontSize: 12),
        )
      ],
    );
  }
}
