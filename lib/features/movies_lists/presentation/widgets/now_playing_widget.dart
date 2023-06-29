import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            '${AppStrings.assetImage}img1.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
