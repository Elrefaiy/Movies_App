import '../../domain/entities/credit.dart';

class CreditModel extends Credit {
  CreditModel({
    required int id,
    required List<CastModel> cast,
    required List<CrewModel> crew,
  }) : super(
          id: id,
          casts: cast,
          crew: crew,
        );

  factory CreditModel.fromJson(Map<String, dynamic> json) => CreditModel(
        id: json["id"],
        cast: List<CastModel>.from(
          json["cast"].map((x) => CastModel.fromJson(x)),
        ),
        crew: List<CrewModel>.from(
          json["crew"].map((x) => CrewModel.fromJson(x)),
        ),
      );
}

class CastModel extends Cast {
  CastModel({
    required int id,
    required String? profilePath,
    required String name,
    required double popularity,
    required String character,
    required int order,
  }) : super(
          id: id,
          profilePath: profilePath,
          name: name,
          popularity: popularity,
          character: character,
          order: order,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        id: json["id"],
        profilePath: json["profile_path"] ?? '',
        name: json["name"],
        popularity: json["popularity"]?.toDouble(),
        character: json["character"],
        order: json["order"],
      );
}

class CrewModel extends Crew {
  CrewModel({
    required int id,
    required String? profilePath,
    required String name,
    required double popularity,
    required String job,
    required String department,
  }) : super(
          id: id,
          profilePath: profilePath,
          name: name,
          popularity: popularity,
          job: job,
          department: department,
        );

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
        id: json["id"],
        profilePath: json["profile_path"] ?? '',
        name: json["name"],
        popularity: json["popularity"]?.toDouble(),
        job: json["job"],
        department: json["department"],
      );
}
