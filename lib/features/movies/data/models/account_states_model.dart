import '../../domain/entities/account_states.dart';

class AccountStatesModel extends AccountStates {
  AccountStatesModel({
    required int id,
    required bool favorite,
    required RatedModel rated,
    required bool watchlist,
  }) : super(
          id: id,
          favorite: favorite,
          rated: rated,
          watchlist: watchlist,
        );

  factory AccountStatesModel.fromJson(Map<String, dynamic> json) =>
      AccountStatesModel(
        id: json["id"],
        favorite: json["favorite"],
        rated: json["rated"] == false
            ? RatedModel(
                value: 0,
              )
            : RatedModel.fromJson(json["rated"]),
        watchlist: json["watchlist"],
      );
}

class RatedModel extends Rated {
  RatedModel({
    required double value,
  }) : super(value: value);

  factory RatedModel.fromJson(Map<String, dynamic> json) => RatedModel(
        value: json["value"]?.toDouble(),
      );
}
