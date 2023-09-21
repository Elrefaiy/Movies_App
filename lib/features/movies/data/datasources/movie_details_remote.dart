import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

import '../models/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetailsRemote({required int id});
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final ApiConsumer apiConsumer;
  MovieDetailsRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<MovieDetailsModel> getMovieDetailsRemote({
    required int id,
  }) async {
    final response = await apiConsumer.get(path: '${EndPoints.movie}$id');
    return MovieDetailsModel.fromJson(response);
  }
}
