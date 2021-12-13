import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

class IconWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  IconWidget({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        Text(label, style: labelTextStyle),
      ],
    );
  }
}
