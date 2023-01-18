import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button_widget.dart';
import 'package:bmi_calculator/components/circle_icon_button.dart';
import 'package:bmi_calculator/components/icon_widget.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/nav_drawer_widget.dart';
import '../constants.dart';
import 'result_page.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      endDrawer: const DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild:
                        const IconWidget(icon: Icons.male, label: 'MALE'),
                    color: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInActiveCardColor,
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
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild:
                        const IconWidget(icon: Icons.female, label: 'FEMALE'),
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
            child: ReusableCard(
              color: kContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2.0,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: kBottomContainerColor,
                      overlayColor: const Color(0x29FF0067),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 24.0),
                      trackShape: const RectangularSliderTrackShape(),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kContainerColor,
                    cardChild: weightColumn(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kContainerColor,
                    cardChild: ageColumn(),
                  ),
                ),
              ],
            ),
          ),
          BottomButtonWidget(
            label: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpolation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Column weightColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('WEIGHT', style: kLabelTextStyle),
        Text(weight.toString(), style: kNumberTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: () {
                setState(() {
                  if (weight > 0) --weight;
                });
                print('+');
              },
            ),
            const SizedBox(width: 8.0),
            CircleIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: () {
                setState(() {
                  if (weight < 200) ++weight;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Column ageColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('AGE', style: kLabelTextStyle),
        Text(age.toString(), style: kNumberTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: () {
                setState(() {
                  if (age > 0) --age;
                });
                print('+');
              },
            ),
            const SizedBox(width: 8.0),
            CircleIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: () {
                setState(() {
                  if (age < 200) ++age;
                });
                print('-');
              },
            ),
          ],
        )
      ],
    );
  }
}

