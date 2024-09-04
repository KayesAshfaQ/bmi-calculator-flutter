import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        title: const Text('Your Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: resultCard(),
          ),
          Expanded(
            child: BottomButtonWidget(
              label: 'RE-CALCULATE',
              prefixIcon: FontAwesomeIcons.redo,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget resultCard() {
    return ReusableCard(
      color: kColorActiveCard,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            resultText,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bmiResult,
            style: kTextStyleNumber,
          ),
          const Column(
            children: [
              Text(
                'Normal BMI range',
                style: TextStyle(fontSize: 24.0, color: kColorLightGrey),
              ),
              Text(
                '18.5 - 25 kg/m\u{00B2}',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              interpolation,
              style: kTextStyleResultDetails,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
