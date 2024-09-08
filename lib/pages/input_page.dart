import 'dart:async';

import 'package:bmi_calculator/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/calculator_controller.dart';
import '../components/bottom_button_widget.dart';
import '../components/circle_icon_button.dart';
import '../components/icon_widget.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../utils/shared_pref_util.dart';
import 'result_page.dart';
import 'settings_page.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Imperial selectedImperial;
  late Metric selectedMetric;
  Gender selectedGender = Gender.MALE;
  int height = 180;
  int weight = 50;
  int age = 20;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchCachedData();
  }

  void _updateUnit(bool isWeight, bool isIncrement) {
    if (isWeight) {
      if (isIncrement) {
        if (selectedMetric == Metric.kg) {
          setState(() {
            if (weight < 200) ++weight;
          });
        } else {
          setState(() {
            if (weight < 440) ++weight;
          });
        }
      } else {
        setState(() {
          if (weight > 0) --weight;
        });
      }
    } else {
      if (isIncrement) {
        setState(() {
          if (age < 150) ++age;
        });
      } else {
        setState(() {
          if (age > 0) --age;
        });
      }
    }
  }

  void _startUpdatingUnit(bool isWeight, bool isIncrement) {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _updateUnit(isWeight, isIncrement);
    });
  }

  void _stopUpdatingWeight(_) {
    _timer?.cancel();
  }

  void fetchCachedData() {
    // get imperial and metric values from shared preferences
    selectedImperial = Imperial.values.firstWhere((element) => element.toString() == Preference.getString(kKeyImperialValue), orElse: () => Imperial.ft);
    selectedMetric = Metric.values.firstWhere((element) => element.toString() == Preference.getString(kKeyMetricValue), orElse: () => Metric.kg);

    // print log
    debugPrint('Imperial: $selectedImperial');
    debugPrint('Metric: $selectedMetric');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // pass data to settings page using arguments

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    selectedImperial: selectedImperial,
                    selectedMetric: selectedMetric,
                    onSettingsChanged: () {
                      fetchCachedData();
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
      // endDrawer: const DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: const IconWidget(icon: Icons.male, label: 'MALE'),
                    color: selectedGender == Gender.MALE ? kColorActiveCard : kColorInActiveCard,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.FEMALE ? kColorActiveCard : kColorInActiveCard,
                    cardChild: const IconWidget(icon: Icons.female, label: 'FEMALE'),
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
                  const Text('HEIGHT', style: kTextStyleLabel),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [Text(height.toString(), style: kTextStyleNumber), const Text('cm', style: kTextStyleLabel)],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2.0,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: kColorBottomContainer,
                      overlayColor: const Color(0x29FF0067),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
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
            suffixIcon: FontAwesomeIcons.arrowRight,
            onTap: () {
              CalculatorController calc = CalculatorController(height: height, weight: weight);

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

  Widget weightColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('WEIGHT', style: kTextStyleLabel),
        Text(weight.toString(), style: kTextStyleNumber),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: () => _updateUnit(true, false),
              onLongPress: () => _startUpdatingUnit(true, false),
              onLongPressEnd: _stopUpdatingWeight,
            ),
            const SizedBox(width: 8.0),
            CircleIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: () => _updateUnit(true, true),
              onLongPress: () => _startUpdatingUnit(true, true),
              onLongPressEnd: _stopUpdatingWeight,
            ),
          ],
        )
      ],
    );
  }

  Widget ageColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('AGE', style: kTextStyleLabel),
        Text(age.toString(), style: kTextStyleNumber),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: () => _updateUnit(false, false),
              onLongPress: () => _startUpdatingUnit(false, false),
              onLongPressEnd: _stopUpdatingWeight,
            ),
            const SizedBox(width: 8.0),
            CircleIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: () => _updateUnit(false, true),
              onLongPress: () => _startUpdatingUnit(false, true),
              onLongPressEnd: _stopUpdatingWeight,
            ),
          ],
        )
      ],
    );
  }
}
