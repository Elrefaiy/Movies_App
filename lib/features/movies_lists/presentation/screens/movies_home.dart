import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/movies_lists_cubit.dart';

import '../widgets/header.dart';
import '../widgets/movie.dart';
import '../widgets/movies_bottom_bar.dart';

class MoviesHomeScreen extends StatefulWidget {
  const MoviesHomeScreen({super.key});

  @override
  State<MoviesHomeScreen> createState() => _MoviesHomeScreenState();
}

class _MoviesHomeScreenState extends State<MoviesHomeScreen> {
  double top = -300;
  double left = -300;
  final columns = sqrt(100).toInt();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black.withOpacity(.8),
        width: 270,
        elevation: 0,
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          //set the state
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
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  top: top,
                  left: left,
                  child: SizedBox(
                    width: columns * 320,
                    child: Wrap(
                      spacing: 20,
                      children: List.generate(
                        100,
                        (index) => Transform.translate(
                          offset: Offset(0, index.isEven ? 240 : 0),
                          child: Movie(),
                        ),
                      ),
                    ),
                  ),
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
