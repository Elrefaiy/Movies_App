import '../../domain/entities/details.dart';

class DetailsModel extends Details {
  DetailsModel({
    required int id,
    required String name,
    required String username,
  }) : super(
          id: id,
          name: name,
          username: username,
        );
  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );
}
