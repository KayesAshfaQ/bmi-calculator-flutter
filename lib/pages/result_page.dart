import 'dart:ui';

import 'package:bmi_calculator/components/bottom_button_widget.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult, resultText, interpolation;

  ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.interpolation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(12.0),
              child: Text(
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
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: kNumberTextStyle,
                  ),
                  Column(
                    children: [
                      Text(
                        'Normal BMI range',
                        style:
                            TextStyle(fontSize: 24.0, color: kLightGreyColor),
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
                      style: kResutlDetailsTextStyle,
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
