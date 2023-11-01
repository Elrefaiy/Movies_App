import '../../domain/entities/image.dart';

class ImagesModel extends Images {
  ImagesModel({
    required List<ImageDetailsModel> backdrops,
    required int id,
    required List<ImageDetailsModel> logos,
    required List<ImageDetailsModel> posters,
  }) : super(
          backdrops: backdrops,
          id: id,
          logos: logos,
          posters: posters,
        );

  factory ImagesModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ImagesModel(
        backdrops: List<ImageDetailsModel>.from(
          json["backdrops"].map(
            (x) => ImageDetailsModel.fromJson(x),
          ),
        ),
        id: json["id"],
        logos: List<ImageDetailsModel>.from(
          json["logos"].map(
            (x) => ImageDetailsModel.fromJson(x),
          ),
        ),
        posters: List<ImageDetailsModel>.from(
          json["posters"].map(
            (x) => ImageDetailsModel.fromJson(x),
          ),
        ),
      );
}

class ImageDetailsModel extends ImageDetails {
  ImageDetailsModel({
    required double aspectRatio,
    required int height,
    required String filePath,
    required double voteAverage,
    required int voteCount,
    required int width,
  }) : super(
          aspectRatio: aspectRatio,
          height: height,
          filePath: filePath,
          voteAverage: voteAverage,
          voteCount: voteCount,
          width: width,
        );

  factory ImageDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ImageDetailsModel(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );
}
