import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress;
  final Function(LongPressEndDetails)? onLongPressEnd;

  const CircleIconButton({
    super.key,
    this.icon,
    this.onPress,
    this.onLongPress,
    this.onLongPressEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onLongPressEnd: onLongPressEnd,
      child: RawMaterialButton(
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        constraints: const BoxConstraints.tightFor(height: 50.0, width: 50.0),
        elevation: 6.0,
        onPressed: onPress,
        child: Icon(icon),
      ),
    );
  }
}
