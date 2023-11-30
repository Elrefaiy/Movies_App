import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/blur_button.dart';
import '../cubit/movies_cubit.dart';

class MoviesHeader extends StatelessWidget {
  final int id;
  const MoviesHeader({required this.id, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 50,
      ),
      child: Row(
        children: [
          BlurButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icons.keyboard_arrow_left_rounded,
          ),
          Spacer(),
          BlurButton(
            onPressed: () {
              MoviesCubit.get(context).getImages(id: id);
              Navigator.pushNamed(
                context,
                Routes.movieImages,
              );
            },
            icon: Icons.image_outlined,
          ),
        ],
      ),
    );
  }
}
