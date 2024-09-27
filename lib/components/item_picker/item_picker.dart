import 'package:flutter/material.dart';
import './item_picker_view.dart';

class ItemPicker extends StatefulWidget {
    const ItemPicker({
    Key? key,
    required this.containerHeight,
  }) : super(key: key);

  final double containerHeight;
  @override
  ItemPickerView createState() => new ItemPickerView();
}
  
