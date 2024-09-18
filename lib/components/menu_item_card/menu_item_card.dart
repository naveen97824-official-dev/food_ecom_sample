import 'package:flutter/material.dart';
import 'package:food_ecom_sample/models/menu/menu.dart';
import 'package:food_ecom_sample/models/menu/product/product.dart';
import './menu_item_card_view.dart';

class MenuItemCard extends StatefulWidget {
  final Product menu;
  MenuItemCard({required this.menu});
  @override
  MenuItemCardView createState() => new MenuItemCardView();
}
