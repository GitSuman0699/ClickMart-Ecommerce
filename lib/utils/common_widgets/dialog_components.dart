import 'package:firebase_project/utils/device/ui_helper.dart';
import 'package:flutter/material.dart';

class DialogComponents {
  static loaderShow(BuildContext context) {
    return showDialog(
      context: context,
      useRootNavigator: false,
      barrierColor: null,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          content: Builder(
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }

  static loaderStop(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static snackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
