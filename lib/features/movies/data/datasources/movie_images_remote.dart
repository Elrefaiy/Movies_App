import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/image_model.dart';

abstract class GetMovieImagesRemoteDataSorce {
  Future<ImagesModel> getImageRemote({
    required int id,
  });
}

class GetMovieImagesRemoteDSImpl implements GetMovieImagesRemoteDataSorce {
  final ApiConsumer apiConsumer;
  GetMovieImagesRemoteDSImpl({
    required this.apiConsumer,
  });

  @override
  Future<ImagesModel> getImageRemote({
    required int id,
  }) async {
    final response = await apiConsumer.get(
      path: EndPoints.images(id),
    );
    return ImagesModel.fromJson(response);
  }
}
