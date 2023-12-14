import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/blur_button.dart';
import '../cubit/account_cubit.dart';
import '../widgets/favorite_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            if (state is GetFavoritesSuccess) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        BlurButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icons.keyboard_arrow_left_rounded,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Favorites - ${AccountCubit.get(context).favorite.totalResults}',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 22,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      crossAxisCount: 2,
                      childAspectRatio: .6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        AccountCubit.get(context).favResults.length,
                        (index) {
                          return FavoriteItem(
                            movie: AccountCubit.get(context).favResults[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
