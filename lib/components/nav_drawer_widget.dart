import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: const Color.fromRGBO(17, 19, 40, 0.7),
      width: width * 0.5,
      child: ListView(
        children: <Widget>[
          Container(
            height: 150,
            color: kBottomContainerColor,
            child: Center(
              child: Image.asset(
                'assets/bmi.png',
                height: width * 0.3,
                width: width * 0.3,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.infoCircle,
              color: Colors.white,
            ),
            title: const Text('About'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text('Item 2'),
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }
}
