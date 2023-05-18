import 'package:flutter/material.dart';
import 'package:techlert/pages/homepage.dart';

void navigateToConfirmationPage(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // prevent tapping outside of dialog to dismiss
    builder: (_) => WillPopScope(
      // prevent back button from dismissing
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are the details correct?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    ),
  );
}
