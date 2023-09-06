class Videos {
  int id;
  List<Results> results;

  Videos({
    required this.id,
    required this.results,
  });
}

class Results {
  String id;
  String publishDate;
  bool official;
  String type;
  String site;
  String key;
  String name;

  Results({
    required this.id,
    required this.publishDate,
    required this.official,
    required this.type,
    required this.site,
    required this.key,
    required this.name,
  });
}
