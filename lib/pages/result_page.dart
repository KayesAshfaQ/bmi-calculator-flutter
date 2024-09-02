import 'package:flutter/material.dart';

import '../components/bottom_button_widget.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult, resultText, interpolation;

  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpolation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(12.0),
              child: const Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: const TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: kNumberTextStyle,
                  ),
                  const Column(
                    children: [
                      Text(
                        'Normal BMI range',
                        style: TextStyle(fontSize: 24.0, color: kLightGreyColor),
                      ),
                      Text(
                        '18.5 - 25 kg/m\u{00B2}',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      interpolation,
                      style: kResultDetailsTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButtonWidget(
              label: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
