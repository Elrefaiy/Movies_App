import 'dart:math';
import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/movie.dart';
import '../widgets/movies_bottom_bar.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
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
              top = top + (details.delta.dy * 1.5);
              left = left + (details.delta.dx * 1.5);
            },
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
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
          ),
        ),
      ),
    );
  }
}
