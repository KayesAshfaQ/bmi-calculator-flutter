import 'package:flutter/material.dart';

import 'widgets/icon_widget.dart';
import 'widgets/reusable_card.dart';

const containerColor = Color(0xFF1D1F33);
const bottomContainerColor = Color(0xFFFF0067);
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: IconWidget(icon: Icons.male, label: 'MALE'),
                    color: selectedGender == Gender.MALE
                        ? activeCardColor
                        : inActiveCardColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.FEMALE
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: IconWidget(icon: Icons.female, label: 'FEMALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(color: containerColor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: containerColor),
                ),
                Expanded(
                  child: ReusableCard(color: containerColor),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            height: 60.0,
            width: double.infinity,
            color: Color(0xFFFF0067),
          )
        ],
      ),
    );
  }
}
