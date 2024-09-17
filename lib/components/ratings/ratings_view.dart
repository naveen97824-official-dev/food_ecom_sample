import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/ratings/ratings.dart';
import './ratings_view_model.dart';

class RatingsView extends State<Ratings> {
  RatingsViewModel viewModel = RatingsViewModel();
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        );
      }),
    );
  }
}
