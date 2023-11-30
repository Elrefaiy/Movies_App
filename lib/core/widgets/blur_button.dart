import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BlurButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const BlurButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 5,
      blurColor: AppColors.blur,
      colorOpacity: .4,
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: 50,
        height: 50,
      ),
      overlay: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
