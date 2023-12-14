import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/account_cubit.dart';
import '../widgets/rated_item.dart';

import '../../../../core/widgets/blur_button.dart';

class RatedMoviesScreen extends StatelessWidget {
  const RatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.grey[900]!.withOpacity(.5),
      onRefresh: () => AccountCubit.get(context).getRatedMovies(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              if (state is GetRatedMoviesSuccess) {
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
                            'Rated Movies - ${AccountCubit.get(context).rated.totalResults}',
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
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
                        crossAxisCount: 2,
                        childAspectRatio: .6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(
                          AccountCubit.get(context).ratedResults.length,
                          (index) {
                            return RatedItem(
                              movie:
                                  AccountCubit.get(context).ratedResults[index],
                            );
                          },
                        ),
                      ),
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
      ),
    );
  }
}
