import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/blur_container/blur_container.dart';
import 'package:food_ecom_sample/components/explicit_animations/explicit_animations.dart';
import 'package:food_ecom_sample/components/item_picker/item_picker.dart';
import 'package:food_ecom_sample/pages/animation_page/animation_page.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './animation_page_view_model.dart';

class AnimationPageView extends State<AnimationPage> {
  AnimationPageViewModel viewModel = new AnimationPageViewModel();

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Container(
      color: ColorTheme.colorTheme.primaryColor,
      child: ListView(
        children: [
          BlurContainer(
            containerHeight: MediaQuery.of(context).size.height - 150,
            child: ItemPicker(
                containerHeight: MediaQuery.of(context).size.height - 150),
          ),
          SizedBox(
            height: 20,
          ),
          ExplicitAnimations()
        ],
      ),
    );
  }
}
