import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/blur_container/blur_container.dart';
import 'package:food_ecom_sample/components/explicit_animations/explicit_animations.dart';
import 'package:food_ecom_sample/components/rectangle/rectangle.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './explicit_animations_view_model.dart';

class ExplicitAnimationsView extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  ExplicitAnimationsViewModel viewModel = ExplicitAnimationsViewModel();
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return BlurContainer(
      containerHeight: 200,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child:  Rectangle(
            color1: ColorTheme.colorTheme.primaryColor,
            color2: ColorTheme.colorTheme.successColor,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );  }
}
