import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../features/movies_lists/presentation/cubit/movies_lists_cubit.dart';
import '../utils/app_strings.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final List<String> lables = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  InkWell listItem({
    required BuildContext context,
    required int index,
    required String lable,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        MoviesListsCubit.get(context).changeCurrentListIndex(index);
        switch (MoviesListsCubit.get(context).currentListIndex) {
          case 0:
            MoviesListsCubit.get(context).getNowPlaying();
            break;
          case 1:
            MoviesListsCubit.get(context).getPopular();
            break;
          case 2:
            MoviesListsCubit.get(context).getTopRated();
            break;
          case 3:
            MoviesListsCubit.get(context).getUpComing();
            break;
          default:
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: index == MoviesListsCubit.get(context).currentListIndex
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromARGB(108, 229, 45, 39),
                    Color.fromARGB(0, 179, 18, 23),
                  ],
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                ),
                border: Border(
                  left: BorderSide(
                    width: 5,
                    color: Colors.red,
                  ),
                ),
              )
            : null,
        child: Row(
          children: [
            Text(
              lable,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(.4),
      width: double.infinity,
      elevation: 0,
      child: Blur(
        child: Container(),
        overlay: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      '${AppStrings.assetImage}profile.png',
                    ),
                    width: 80,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mr. Guest',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Guest User',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Discover',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 20),
              Text(
                'Movies',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: 4,
                itemBuilder: (context, index) => listItem(
                  context: context,
                  index: index,
                  lable: lables[index],
                ),
              ),
            ],
          ),
        ),
        blurColor: Colors.black,
        blur: 10,
      ),
    );
  }
}
