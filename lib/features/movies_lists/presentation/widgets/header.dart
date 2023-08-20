import 'package:flutter/material.dart';

import '../../../../core/widgets/blur_button.dart';
import '../cubit/movies_lists_cubit.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlurButton(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icons.menu_rounded,
          ),
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlurButton(
                onTap: () {},
                icon: Icons.search_rounded,
              ),
              SizedBox(height: 20),
              BlurButton(
                onTap: () {
                  MoviesListsCubit.get(context).getNowPlaying();
                },
                icon: Icons.add_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
