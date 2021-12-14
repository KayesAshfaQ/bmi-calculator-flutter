import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;

  CircleIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPress,
    );
  }
}
