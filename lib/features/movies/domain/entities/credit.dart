class Credit {
  int id;
  List<Cast> casts;
  List<Crew> crew;

  Credit({
    required this.id,
    required this.casts,
    required this.crew,
  });
}

class Cast {
  int id;
  String name;
  String? profilePath;
  double popularity;
  String character;
  int order;

  Cast({
    required this.id,
    required this.profilePath,
    required this.name,
    required this.popularity,
    required this.character,
    required this.order,
  });
}

class Crew {
  int id;
  String? profilePath;
  String name;
  double popularity;
  String job;
  String department;

  Crew({
    required this.id,
    required this.profilePath,
    required this.name,
    required this.popularity,
    required this.job,
    required this.department,
  });
}
