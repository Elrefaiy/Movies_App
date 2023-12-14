class AccountStates {
  int id;
  bool favorite;
  Rated rated;
  bool watchlist;

  AccountStates({
    required this.id,
    required this.favorite,
    required this.rated,
    required this.watchlist,
  });
}

class Rated {
  double value;

  Rated({
    required this.value,
  });
}
