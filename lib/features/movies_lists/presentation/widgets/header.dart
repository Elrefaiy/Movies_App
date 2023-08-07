import 'package:flutter/material.dart';

import '../../../../core/widgets/blur_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 45,
      ),
      child: Row(
        children: [
          BlurButton(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icons.menu_rounded,
          ),
          Spacer(),
          BlurButton(
            onTap: () {},
            icon: Icons.search_rounded,
          ),
        ],
      ),
    );
  }
}
