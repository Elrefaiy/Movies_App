import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class FavoriteParams extends Equatable {
  final String mediaType = 'movie';
  final int mediaId;
  final bool favorite;

  FavoriteParams({
    required this.mediaId,
    required this.favorite,
  });

  @override
  List<Object?> get props => [mediaType, mediaId, favorite];
}

class WatchlistParams extends Equatable {
  final String mediaType = 'movie';
  final int mediaId;
  final bool watchlist;

  WatchlistParams({
    required this.mediaId,
    required this.watchlist,
  });

  @override
  List<Object?> get props => [mediaType, mediaId, watchlist];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
