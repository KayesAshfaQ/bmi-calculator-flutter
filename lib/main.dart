import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'pages/input_page.dart';

const primaryColor = Color(0xFF090C22);

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  return runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
