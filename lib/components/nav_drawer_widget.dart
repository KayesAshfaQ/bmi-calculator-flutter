import 'package:bmi_calculator/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../pages/about_page.dart';
import '../pages/terms_conditions.dart';
import 'drawer_list_item_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: kBottomContainerColor.withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      width: width * 0.55,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.15,
            child: Center(
              child: Image.asset(
                'assets/bmi.png',
                height: width * 0.25,
                width: width * 0.25,
              ),
            ),
          ),
          // divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ),
          DrawerListItemWidget(
            icon: Icons.settings,
            label: 'Settings',
            onTap: push(context, const SettingsPage()),
          ),
          const DrawerListItemWidget(
            icon: FontAwesomeIcons.share,
            label: 'Share app',
          ),
          const DrawerListItemWidget(
            icon: Icons.rate_review_rounded,
            label: 'Give review',
          ),
          const DrawerListItemWidget(
            icon: Icons.bug_report,
            label: 'Report a bug',
          ),
          DrawerListItemWidget(
            icon: FontAwesomeIcons.book,
            label: 'Terms & Conditions',
            onTap: push(context, const TermsConditions()),
          ),
          DrawerListItemWidget(
            icon: FontAwesomeIcons.infoCircle,
            label: 'About us',
            onTap: push(context, const AboutPage()),
          ),
        ],
      ),
    );
  }

  Function() push(context, widget) {
    // return a function
    return () {
      // close the drawer
      Navigator.pop(context);

      // navigate to the widget
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
    };
  }
}
