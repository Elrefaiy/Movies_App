import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/widgets/drawer.dart';
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
  double left = -215;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(
            () {
              top = top + (details.delta.dy * 1.8);
              left = left + (details.delta.dx * 1.8);
            },
          );
        },
        child: BlocConsumer<MoviesListsCubit, MoviesListsState>(
          listener: (context, state) {
            if (state is ChangeCurrentListIndex) {
              top = -280;
              left = -215;
            }
          },
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
