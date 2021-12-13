import 'package:flutter/material.dart';

import 'widgets/icon_widget.dart';
import 'widgets/reusable_card.dart';

const containerColor = Color(0xFF1D1F33);
const bottomContainerColor = Color(0xFFFF0067);
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inActiveCardColor;
  Color femaleColor = inActiveCardColor;

  //1=male 2=female
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleColor == inActiveCardColor) {
        maleColor = activeCardColor;
        femaleColor = inActiveCardColor;
      } else {
        maleColor = inActiveCardColor;
      }
    } else {
      if (femaleColor == inActiveCardColor) {
        femaleColor = activeCardColor;
        maleColor = inActiveCardColor;
      } else {
        femaleColor = inActiveCardColor;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      color: maleColor,
                      cardChild: IconWidget(icon: Icons.male, label: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      color: femaleColor,
                      cardChild:
                          IconWidget(icon: Icons.female, label: 'FEMALE'),
                    ),
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
