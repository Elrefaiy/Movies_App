import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/blur_button.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_movie.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      BlurButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.keyboard_arrow_left_rounded,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: controller,
                            onChanged: (String title) {
                              SearchCubit.get(context)
                                  .SearchMovie(title: title);
                            },
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade900,
                              labelText: 'Search Movie',
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                gapPadding: 5,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  if (controller.text.isNotEmpty)
                                    controller.text = '';
                                },
                                icon: Icon(
                                  controller.text == ''
                                      ? Icons.search_rounded
                                      : Icons.highlight_remove_rounded,
                                  size: 20,
                                ),
                              ),
                              suffixIconColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is SearchMovieSuccessfully)
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.result.length,
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 50),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15);
                      },
                      itemBuilder: (context, index) {
                        return SearchMovieWidget(
                          result: state.result[index],
                        );
                      },
                    ),
                  ),
                if (state is SearchMovieLoading)
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
