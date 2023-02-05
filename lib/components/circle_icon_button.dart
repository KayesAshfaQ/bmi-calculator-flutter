import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;

  const CircleIconButton({super.key, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(height: 50.0, width: 50.0),
      elevation: 6.0,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
