import 'package:flutter/material.dart';
import 'package:food_ecom_sample/components/item_picker/item_picker.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';
import './item_picker_view_model.dart';

class ItemPickerView extends State<ItemPicker> {
  ItemPickerViewModel viewModel = ItemPickerViewModel();
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    const double listContainerBorderWidth = 1.5;
    const int itemsCount = 8;
    double itemHeight =
        (widget.containerHeight - listContainerBorderWidth * 2) / itemsCount;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: viewModel.selectedItemIndex * itemHeight,
            left: 0,
            right: 0,
            height: itemHeight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                8,
                (i) => Expanded(
                  child: InkWell(
                    onTap: () =>
                        setState(() => viewModel.selectedItemIndex = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'List Item ${i + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            if (i == 1)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: viewModel.selectedItemIndex == i
                                      ? ColorTheme.colorTheme.primaryColor
                                      : ColorTheme.colorTheme.primaryLightColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: viewModel.selectedItemIndex == i
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: viewModel.selectedItemIndex == i
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  child: const Text('Featured!'),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
