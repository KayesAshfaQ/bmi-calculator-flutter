import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/ripple_view.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/unit_selection_widget.dart';
import '../controllers/settings_controller.dart';
import 'about_page.dart';
import 'terms_conditions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsController settingsController;

  @override
  void initState() {
    settingsController = SettingsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ReusableCard(
            color: kColorActiveCard,
            cardChild: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Units', style: kTextStyleLabel),
                  const Divider(
                    color: kColorLightGrey,
                    thickness: 0.25,
                  ),
                  const SizedBox(height: 8.0),
                  UnitSelectionWidget<Imperial>(
                    label: 'Imperial',
                    icon: FontAwesomeIcons.rulerCombined,
                    items: settingsController.getImperialUnits(),
                    selectedItem: settingsController.selectedImperial,
                    onTap: (val) {
                      setState(() {
                        settingsController.selectedImperial = val;
                      });
                      settingsController.showToast('Unit changed to ${settingsController.getImperial()}');
                      debugPrint(settingsController.selectedImperial.toString());
                    },
                  ),
                  const SizedBox(height: 8.0),
                  UnitSelectionWidget<Metric>(
                    label: 'Metric',
                    icon: FontAwesomeIcons.weightScale,
                    items: settingsController.getMetricUnits(),
                    selectedItem: settingsController.selectedMetric,
                    onTap: (val) {
                      setState(() {
                        settingsController.selectedMetric = val;
                      });
                      settingsController.showToast('Unit changed to ${settingsController.getMetric()}');
                      debugPrint(settingsController.selectedMetric.toString());
                    },
                  )
                ],
              ),
            ),
          ),
          ReusableCard(
            color: kColorActiveCard,
            cardChild: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Others', style: kTextStyleLabel),
                  const Divider(
                    color: kColorLightGrey,
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
                          builder: (context) => const TermsConditions(),
                        ),
                      );
                    },
                  ),
                  settingItem(
                    'About Us',
                    FontAwesomeIcons.circleInfo,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Version 1.0.0',
            style: TextStyle(
              color: kColorLightGrey,
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
