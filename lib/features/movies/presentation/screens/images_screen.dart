import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/movies_cubit.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MoviesCubit.get(context);

    Widget body() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Logos'.padLeft(10),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.1),
                    radius: 40,
                    child: Image(
                      image: NetworkImage(
                        '${AppStrings.imageBase}${cubit.logos[index].filePath}',
                      ),
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: cubit.logos.length,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Posters'.padLeft(10),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: .7,
                enlargeCenterPage: true,
                enlargeFactor: .25,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
              ),
              items: List.generate(
                cubit.posters.length,
                (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(
                        '${AppStrings.imageBase}${cubit.posters[index].filePath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Backdrops'.padLeft(12),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            ListView.separated(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: NetworkImage(
                      '${AppStrings.imageBase}${cubit.backdrops[index].filePath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: cubit.backdrops.length,
            )
          ],
        ),
      );
    }

    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return Scaffold(
          body: state is GetImagesSuccessfully
              ? body()
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
