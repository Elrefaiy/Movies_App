import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movies_application/features/movies_lists/presentation/cubit/movies_lists_cubit.dart';
import 'package:movies_application/features/movies_lists/presentation/widgets/now_playing_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'Now Playing',
      'Popular',
      'Up Comming',
      'Top Rated',
    ];

    var cubit = MoviesListsCubit.get(context);
    return BlocBuilder<MoviesListsCubit, MoviesListsState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signin.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.7), BlendMode.darken),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'Hey There!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Today, ${DateFormat.yMMMMd().format(DateTime.now())}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          cubit.changeCurrentListIndex(index);
                        },
                        child: Container(
                          decoration: cubit.currentListIndex == index
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                )
                              : null,
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 25);
                    },
                    itemCount: 4,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  flex: 6,
                  child: Animate(
                    effects: [
                      FadeEffect(duration: 1000.ms),
                    ],
                    child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {},
                        enlargeFactor: .25,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        disableCenter: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: 1.5.seconds,
                      ),
                      items: List.generate(
                        4,
                        (index) {
                          return NowPlayingWidget();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  titles[cubit.currentListIndex],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ).animate().fade(duration: 1000.ms),
                Text(
                  'Fantacy, Science Fiction',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'num',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          '277',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'num',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          '277',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'num',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          '277',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 160,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Movie Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
