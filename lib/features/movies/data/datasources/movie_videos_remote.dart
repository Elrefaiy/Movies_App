import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/video_model.dart';

abstract class MovieVideosRemoteDataSource {
  Future<VideosModel> getVideosRemote({
    required int id,
  });
}

class MovieVideosRemoteImpl implements MovieVideosRemoteDataSource {
  final ApiConsumer apiConsumer;
  MovieVideosRemoteImpl({required this.apiConsumer});

  @override
  Future<VideosModel> getVideosRemote({
    required int id,
  }) async {
    final response = await apiConsumer.get(
      path: EndPoints.videos(id),
    );
    return VideosModel.fromJson(response);
  }
}
