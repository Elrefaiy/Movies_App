import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/blur_button.dart';
import '../cubit/movies_lists_cubit.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesListsCubit cubit = MoviesListsCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 45,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlurButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icons.menu_rounded,
          ),
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlurButton(
                onPressed: () {},
                icon: Icons.search_rounded,
              ),
              SizedBox(height: 20),
              BlocBuilder<MoviesListsCubit, MoviesListsState>(
                builder: (context, state) {
                  if (state is LoadingMovieList)
                    return Blur(
                      blur: 5,
                      blurColor: AppColors.blur,
                      colorOpacity: .4,
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                      ),
                      overlay: Padding(
                        padding: const EdgeInsets.all(13),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  else
                    return BlurButton(
                      onPressed: () {
                        switch (cubit.currentListIndex) {
                          case 0:
                            cubit.getNowPlaying();
                            break;
                          case 1:
                            cubit.getPopular();
                            break;
                          case 2:
                            cubit.getTopRated();
                            break;
                          case 3:
                            cubit.getUpComing();
                            break;
                          default:
                        }
                      },
                      icon: Icons.add_rounded,
                    );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
