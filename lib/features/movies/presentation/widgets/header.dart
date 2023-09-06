import 'package:flutter/material.dart';

import '../../../../core/widgets/blur_button.dart';

class MoviesHeader extends StatelessWidget {
  const MoviesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlurButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icons.keyboard_arrow_left_rounded,
        ),
        Spacer(),
        BlurButton(
          onPressed: () {},
          icon: Icons.more_horiz_rounded,
        ),
      ],
    );
  }
}
