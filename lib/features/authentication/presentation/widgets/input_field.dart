import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  const InputField({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        height: .6,
      ),
      cursorHeight: 15,
      controller: TextEditingController(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withAlpha(20),
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
      ),
    );
  }
}
