import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/app_routes.dart';
import '../../features/account/presentation/cubit/account_cubit.dart';
import '../../features/authentication/presentation/cubit/authentication_cubit.dart';
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
    var isGuest = AuthenticationCubit.get(context).isGuest();
    var details = AccountCubit.get(context).accountDetails;
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
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return Row(
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
                            isGuest ? 'Mr. Guest' : details.username,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            isGuest
                                ? 'you have signed in as a guest'
                                : details.name,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  );
                },
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
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  AccountCubit.get(context).getFavorites();
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    Routes.favorites,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Favorite Movies',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.grey.withOpacity(.4),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  AccountCubit.get(context).getRatedMovies();
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    Routes.ratedMovies,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Rated Movies',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.grey.withOpacity(.4),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Settings',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              if (!isGuest)
                InkWell(
                  onTap: () {
                    AuthenticationCubit.get(context).deleteSession();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Delete Session & Logout',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.grey.withOpacity(.4),
                        ),
                      ],
                    ),
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
