import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/app_routes.dart';
import '../../features/account/presentation/cubit/account_cubit.dart';
import '../../features/authentication/presentation/cubit/authentication_cubit.dart';
import '../../features/movies_lists/presentation/cubit/movies_lists_cubit.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final List<String> lables = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming',
  ];
  final List<String> lablesII = [
    'Favorites Movies',
    'Watchlist Movies',
    'Rated Movies',
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
                    Color.fromARGB(90, 229, 45, 39),
                    Color.fromARGB(0, 179, 18, 23),
                  ],
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
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
              color: index == MoviesListsCubit.get(context).currentListIndex
                  ? Colors.white
                  : Colors.white.withOpacity(.3),
            ),
          ],
        ),
      ),
    );
  }

  InkWell listItemII({
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
            AccountCubit.get(context).getFavorites();
            Navigator.pushNamed(
              context,
              Routes.favorites,
            );
            break;
          case 1:
            AccountCubit.get(context).getWatchlist();
            Navigator.pushNamed(
              context,
              Routes.watchlist,
            );
            break;
          case 2:
            AccountCubit.get(context).getRatedMovies();
            Navigator.pushNamed(
              context,
              Routes.ratedMovies,
            );
            break;
          default:
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
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
              color: Colors.white.withOpacity(.3),
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
            vertical: 25,
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(.15),
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white.withOpacity(.2),
                  size: 60,
                ),
                radius: 40,
              ),
              SizedBox(height: 15),
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return Text(
                    isGuest ? 'Mr. Guest' : details.username,
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'movies',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white.withOpacity(.2),
                      height: 1,
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Text(
                    'your lists',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white.withOpacity(.2),
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: 3,
                itemBuilder: (context, index) => listItemII(
                  context: context,
                  index: index,
                  lable: lablesII[index],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'settings',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white.withOpacity(.2),
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  AuthenticationCubit.get(context).deleteSession().then(
                        (value) => Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.auth,
                          (route) => false,
                        ),
                      );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.redAccent.withOpacity(.5),
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
