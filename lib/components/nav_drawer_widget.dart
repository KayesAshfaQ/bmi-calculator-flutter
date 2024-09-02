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
      backgroundColor: const Color.fromRGBO(17, 19, 40, 0.9),
      width: width * 0.55,
      child: ListView(
        children: <Widget>[
          Container(
            height: 150,
            color: kActiveCardColor,
            child: Center(
              child: Image.asset(
                'assets/bmi.png',
                height: width * 0.25,
                width: width * 0.25,
              ),
            ),
          ),
          const DrawerListItemWidget(
            icon: Icons.settings,
            label: 'Settings',
          ),
          DrawerListItemWidget(
            icon: FontAwesomeIcons.infoCircle,
            label: 'About us',
            onTap: push(context, const AboutPage()),
          ),
           DrawerListItemWidget(
            icon: FontAwesomeIcons.book,
            label: 'Terms & Conditions',
            onTap: push(context, const TermsConditions()),
          ),
          const DrawerListItemWidget(
            icon: Icons.bug_report,
            label: 'Report a bug',
          ),
          const DrawerListItemWidget(
            icon: FontAwesomeIcons.share,
            label: 'Share app',
          ),
          const DrawerListItemWidget(
            icon: Icons.rate_review_rounded,
            label: 'Give review',
          ),
        ],
      ),
    );
  }

  Function() push(context, widget) {
    return () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
  }
}
