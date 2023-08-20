import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/movies_list.dart';
import '../cubit/movies_lists_cubit.dart';

import '../widgets/header.dart';
import '../widgets/movies_bottom_bar.dart';

class MoviesHomeScreen extends StatefulWidget {
  const MoviesHomeScreen({super.key});

  @override
  State<MoviesHomeScreen> createState() => _MoviesHomeScreenState();
}

class _MoviesHomeScreenState extends State<MoviesHomeScreen> {
  double top = -280;
  double left = -755;
  final columns = 8;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black.withOpacity(.5),
        width: double.infinity,
        elevation: 0,
        child: Blur(
          child: Column(),
          blurColor: Colors.black,
          blur: 10,
        ),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(
            () {
              top = top + (details.delta.dy * 2);
              left = left + (details.delta.dx * 2);
            },
          );
        },
        child: BlocConsumer<MoviesListsCubit, MoviesListsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              children: [
                MoviesList(
                  top: top,
                  left: left,
                  currentIndex: MoviesListsCubit.get(context).currentListIndex,
                ),
                Header(),
                MoviesBottomBar(),
              ],
            );
          },
        ),
      ),
    );
  }
}
