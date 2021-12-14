import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final String label;
  final Function() onTap;

  BottomButtonWidget({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8.0),
        height: 60.0,
        width: double.infinity,
        color: Color(0xFFFF0067),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
