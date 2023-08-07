import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BlurButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const BlurButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 5,
      colorOpacity: .3,
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: 50,
        height: 50,
      ),
      overlay: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
