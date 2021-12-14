import 'package:flutter/material.dart';

import '../constants.dart';

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
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
