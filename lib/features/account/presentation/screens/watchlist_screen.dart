import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/grid_item.dart';

import '../../../../core/widgets/blur_button.dart';
import '../cubit/account_cubit.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            if (state is GetWatchlistSuccess) {
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
                          'Watchlists - ${AccountCubit.get(context).watchlist.totalResults}',
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
                        AccountCubit.get(context).watchlistResult.length,
                        (index) {
                          return GridItem(
                            movie: AccountCubit.get(context)
                                .watchlistResult[index],
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
