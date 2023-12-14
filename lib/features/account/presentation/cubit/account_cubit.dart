import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../injection_container.dart' as di;
import '../../domain/entities/details.dart';
import '../../domain/entities/favorite.dart';
import '../../domain/entities/rated.dart';
import '../../domain/usecases/get_details_usecase.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/get_rated_usecase.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final GetDetailsUsecase getDetailsUsecase;
  final GetFavoritesUsecase getFavoritesUsecase;
  final GetRatedUsecase getRatedUsecase;
  AccountCubit({
    required this.getDetailsUsecase,
    required this.getFavoritesUsecase,
    required this.getRatedUsecase,
  }) : super(AccountInitial());

  static AccountCubit get(context) => BlocProvider.of(context);

  late Details accountDetails;
  Future<void> getAccountDetails() async {
    String id = di.sl<SharedPreferences>().getString(AppStrings.sessionId)!;
    var response = await getDetailsUsecase(id);
    response.fold(
      (failure) => emit(GetAccountDetailsError()),
      (details) {
        accountDetails = details;
        emit(GetAccountDetailsSuccess());
      },
    );
  }

  late Favorite favorite;
  late List<FavResult> favResults;
  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    String id = di.sl<SharedPreferences>().getString(AppStrings.sessionId)!;
    var response = await getFavoritesUsecase(id);
    response.fold(
      (failure) => emit(GetFavoritesError()),
      (favorite) {
        this.favorite = favorite;
        favResults = favorite.results;
        emit(GetFavoritesSuccess());
      },
    );
  }

  late Rated rated;
  late List<RatedResult> ratedResults;
  Future<void> getRatedMovies() async {
    emit(GetRatedMoviesLoading());
    String id = di.sl<SharedPreferences>().getString(AppStrings.sessionId)!;
    var response = await getRatedUsecase(id);
    response.fold(
      (failure) => emit(GetRatedMoviesError()),
      (rated) {
        this.rated = rated;
        ratedResults = rated.results;
        emit(GetRatedMoviesSuccess());
      },
    );
  }
}
