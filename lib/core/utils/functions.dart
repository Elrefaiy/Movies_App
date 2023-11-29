import 'package:flutter/material.dart';

class AppFunctions {
  static void showSnakBar({
    required BuildContext context,
    required String lable,
    required IconData icon,
    required Color iconColor,
    required double duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[900],
        content: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 10),
            Text(
              lable,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
