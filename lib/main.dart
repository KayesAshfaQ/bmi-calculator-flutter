import 'package:flutter/material.dart';
import 'pages/input_page.dart';

const primaryColor = Color(0xFF090C22);

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
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0)),
        scaffoldBackgroundColor: primaryColor,
      ),
      home: const InputPage(),
    );
  }
}
