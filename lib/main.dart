import 'package:flutter/material.dart';
import 'pages/input_page.dart';

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
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
                fontSize: 20.0
          )
        ),
        scaffoldBackgroundColor: primaryColor,
      ),
      home: InputPage(),
    );
  }
}