import 'package:movies_application/features/movies/domain/entities/video.dart';

class VideosModel extends Videos {
  VideosModel({
    required int id,
    required List<ResultsModel> results,
  }) : super(
          id: id,
          results: results,
        );

  factory VideosModel.fromJson(Map<String, dynamic> json) => VideosModel(
        id: json["id"],
        results: List<ResultsModel>.from(
          json["results"].map(
            (x) => ResultsModel.fromJson(x),
          ),
        ),
      );
}

class ResultsModel extends Results {
  ResultsModel({
    required String name,
    required String key,
    required String site,
    required String type,
    required bool official,
    required String publishDate,
    required String id,
  }) : super(
          id: id,
          publishDate: publishDate,
          official: official,
          type: type,
          site: site,
          key: key,
          name: name,
        );

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        name: json["name"],
        key: json["key"],
        site: json["site"],
        type: json["type"],
        official: json["official"],
        publishDate: json["published_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "site": site,
        "type": type,
        "official": official,
        "id": id,
      };
}
