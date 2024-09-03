import 'package:bmi_calculator/components/ripple_view.dart';
import 'package:bmi_calculator/pages/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/unit_selection_widget.dart';
import '../controllers/settings_controller.dart';
import 'about_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsController settingsController;

  late List<Imperial> imperialUnits;
  late List<Metric> metricUnits;

  late Imperial selectedImperial;
  late Metric selectedMetric;

  @override
  void initState() {
    settingsController = SettingsController();
    imperialUnits = settingsController.getImperialUnits();
    metricUnits = settingsController.getMetricUnits();

    selectedImperial = settingsController.selectedImperial;
    selectedMetric = settingsController.selectedMetric;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final settingsController = SettingsController();

    // final imperialUnits = settingsController.getImperialUnits();
    // final metricUnits = settingsController.getMetricUnits();

    // var selectedImperial = settingsController.selectedImperial;
    // var selectedMetric = settingsController.selectedMetric;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ReusableCard(
            color: kActiveCardColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Units', style: kLabelTextStyle),
                  const Divider(
                    color: kLightGreyColor,
                    thickness: 0.25,
                  ),
                  const SizedBox(height: 8.0),
                  UnitSelectionWidget<Imperial>(
                    label: 'Imperial',
                    icon: FontAwesomeIcons.rulerCombined,
                    items: imperialUnits,
                    selectedItem: selectedImperial,
                    onTap: (val) {
                      setState(() {
                        selectedImperial = val;
                      });
                      debugPrint(selectedImperial.toString());
                    },
                  ),
                  const SizedBox(height: 8.0),
                  UnitSelectionWidget<Metric>(
                    label: 'Metric',
                    icon: FontAwesomeIcons.weight,
                    items: metricUnits,
                    selectedItem: selectedMetric,
                    onTap: (val) {
                      setState(() {
                        selectedMetric = val;
                      });
                      debugPrint(selectedImperial.toString());
                    },
                  )
                ],
              ),
            ),
          ),
          ReusableCard(
            color: kActiveCardColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Others', style: kLabelTextStyle),
                  const Divider(
                    color: kLightGreyColor,
                    thickness: 0.25,
                  ),
                  const SizedBox(height: 8.0),
                  settingItem(
                    'Share App',
                    FontAwesomeIcons.share,
                    onTap: () {},
                  ),
                  settingItem(
                    'Give Review',
                    Icons.rate_review_rounded,
                    onTap: () {},
                  ),
                  settingItem(
                    'Report Bug',
                    Icons.bug_report,
                    onTap: () {},
                  ),
                  settingItem(
                    'Terms & Conditions',
                    FontAwesomeIcons.book,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermsConditions()));
                    },
                  ),
                  settingItem(
                    'About Us',
                    FontAwesomeIcons.infoCircle,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Version 1.0.0',
            style: TextStyle(
              color: kLightGreyColor,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget settingItem(String label, IconData icon, {void Function()? onTap}) {
    return RippleView(
      rippleColor: Colors.white,
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
