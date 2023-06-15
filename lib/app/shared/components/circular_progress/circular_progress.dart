import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final Widget child;

  CircularProgress({required this.child});

  bool isOpen = false;

  void showLoader(BuildContext context) {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void hideLoader(BuildContext context) {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
