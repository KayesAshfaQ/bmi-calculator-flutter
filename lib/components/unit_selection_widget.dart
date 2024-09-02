import 'package:flutter/material.dart';

import '../constants.dart';

class UnitSelectionWidget<T> extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<T> items;
  final T selectedItem;
  final double height = 32, width = 40.0;

  const UnitSelectionWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.items,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: height,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedItem == items[index];

              return Container(
                margin: const EdgeInsets.all(4),
                constraints: BoxConstraints(
                  minWidth: width,
                  minHeight: height,
                  maxWidth: width,
                  maxHeight: height,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? kBottomContainerColor : null,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: kLightGreyColor,
                    width: 1.0,
                  ),
                ),
                child: Text(items[index].toString().split('.').last),
              );
              // return Text(imperialUnits[index].toString().split('.').last);
            },
          ),
        ),
      ],
    );
  }
}
