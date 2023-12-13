import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/app_strings.dart';
import 'package:movies_application/features/account/domain/entities/details.dart';
import 'package:movies_application/features/account/domain/entities/favorite.dart';
import 'package:movies_application/features/account/domain/usecases/get_details_usecase.dart';
import 'package:movies_application/features/account/domain/usecases/get_favorites_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../injection_container.dart' as di;

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final GetDetailsUsecase getDetailsUsecase;
  final GetFavoritesUsecase getFavoritesUsecase;
  AccountCubit({
    required this.getDetailsUsecase,
    required this.getFavoritesUsecase,
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
  late List<Result> favResults;
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
}
