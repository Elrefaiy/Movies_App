import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../account/presentation/cubit/account_cubit.dart';
import '../../../authentication/presentation/cubit/authentication_cubit.dart';
import '../cubit/movies_cubit.dart';

class AccountStatesWidget extends StatelessWidget {
  const AccountStatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var states = MoviesCubit.get(context).accountState;
    var isGuest = AuthenticationCubit.get(context).isGuest();
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isGuest)
              InkWell(
                onTap: () {
                  AccountCubit.get(context)
                      .updateWatchlist(
                    id: states.id,
                    watchlist: !states.watchlist,
                  )
                      .then(
                    (value) {
                      return MoviesCubit.get(context).getAccountStates(
                        id: states.id,
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.add_rounded,
                      size: 20,
                      color: states.watchlist
                          ? Colors.green[300]
                          : Colors.grey.withOpacity(.3),
                    ),
                    Text(
                      states.watchlist ? 'added' : 'watchlist',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            if (!isGuest)
              Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: 1,
                height: 40,
              ),
            Column(
              children: [
                RatingBar.builder(
                  glowColor: Colors.amber,
                  itemSize: 20,
                  initialRating: states.rated.value / 2,
                  minRating: .5,
                  maxRating: 10,
                  unratedColor: Colors.grey.withOpacity(.3),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  updateOnDrag: true,
                  itemPadding: EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rounded,
                    color: Colors.amberAccent,
                  ),
                  onRatingUpdate: (rating) {
                    MoviesCubit.get(context).updateRating(
                      rating: rating,
                      id: states.id,
                    );
                  },
                ),
                states.rated.value == 0
                    ? Text(
                        'rate',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    : InkWell(
                        onTap: () {
                          MoviesCubit.get(context).deleteRating(id: states.id);
                        },
                        child: Row(
                          children: [
                            Text(
                              'remove ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Icon(
                              Icons.highlight_remove_rounded,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            if (!isGuest)
              Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: 1,
                height: 40,
              ),
            if (!isGuest)
              InkWell(
                onTap: () {
                  AccountCubit.get(context)
                      .updateFavorite(id: states.id, favorite: !states.favorite)
                      .then((value) {
                    return MoviesCubit.get(context)
                        .getAccountStates(id: states.id);
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      size: 20,
                      color: states.favorite
                          ? Colors.redAccent
                          : Colors.grey.withOpacity(.3),
                    ),
                    Text(
                      states.favorite ? 'saved' : 'save',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
