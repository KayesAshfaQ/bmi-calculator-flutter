import 'package:flutter/material.dart';
import 'input_page.dart';

const primaryColor = Color(0xFF090C22);

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
        ),
        scaffoldBackgroundColor: primaryColor,
      ),
      home: InputPage(),
    );
  }
}