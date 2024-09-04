import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/input_page.dart';

void main() {
  return runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kColorPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: kColorPrimary,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
        scaffoldBackgroundColor: kColorPrimary,
      ),
      home: const InputPage(),
    );
  }
}
