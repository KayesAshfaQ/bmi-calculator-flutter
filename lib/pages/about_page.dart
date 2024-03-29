import 'package:flutter/material.dart';

import '../constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About us'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kInActiveCardColor,
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Team',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                kAboutTeam,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Mission',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                kMissionText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
