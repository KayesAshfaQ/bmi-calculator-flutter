import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class AppDialogues {
  Future<void> showUpdateVersionDialog(
    BuildContext context,
    bool isSkippable,
  ) async {
    String store;

    if (Platform.isAndroid) {
      store = "Google Play Console";
    } else {
      store = "App Store";
    }

    String text;
    if (isSkippable) {
      text = "There is a new version available in the $store. Update now!";
    } else {
      text = "There is a new mandatory version available in the $store. Please update to continue using the app!";
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("New version available"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            isSkippable
                ? TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: kColorLightGrey,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Not yet'),
                  )
                : Container(),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: kColorBottomContainer,
              ),
              onPressed: () {
                if (Platform.isAndroid || Platform.isIOS) {
                  // TODO: Add appIDs and enable
                  final appId = Platform.isAndroid ? kConfigAppPackageName : 'not available';

                  final url = Uri.parse(
                    Platform.isAndroid ? "https://play.google.com/store/apps/details?id=$appId" : "https://apps.apple.com/app/id$appId",
                  );

                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
