import 'package:flutter/material.dart';

import '../constants.dart';
import 'ripple_view.dart';

class UnitSelectionWidget<T> extends StatefulWidget {
  final String label;
  final IconData icon;
  final List<T> items;
  final T selectedItem;
  final void Function(T)? onTap;

  const UnitSelectionWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.items,
    required this.selectedItem,
    required this.onTap,
  });

  @override
  State<UnitSelectionWidget<T>> createState() => _UnitSelectionWidgetState<T>();
}

class _UnitSelectionWidgetState<T> extends State<UnitSelectionWidget<T>> {
  final double height = 32, width = 40.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          widget.icon,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          widget.label,
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
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              bool isSelected = widget.selectedItem == widget.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: RippleView(
                  padding: 0,
                  rippleColor: kColorBottomContainer,
                  onTap: () {
                    widget.onTap?.call(widget.items[index]);
                  },
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: width,
                      minHeight: height,
                      maxWidth: width,
                      maxHeight: height,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? kColorBottomContainer : null,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: kColorLightGrey,
                        width: 1.0,
                      ),
                    ),
                    child: Text(widget.items[index].toString().split('.').last),
                  ),
                ),
              );
              // return Text(imperialUnits[index].toString().split('.').last);
            },
          ),
        ),
      ],
    );
  }
}
