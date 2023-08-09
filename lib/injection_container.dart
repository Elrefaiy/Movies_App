import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_application/core/api/api_consumer.dart';
import 'package:movies_application/core/api/dio_consumer.dart';
import 'package:movies_application/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:movies_application/features/movies_lists/data/datasources/now_playing_remote.dart';
import 'package:movies_application/features/movies_lists/data/repositories/get_now_playing_repo_impl.dart';
import 'package:movies_application/features/movies_lists/domain/repositories/get_now_playing.dart';
import 'package:movies_application/features/movies_lists/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_application/features/movies_lists/presentation/cubit/movies_lists_cubit.dart';
import 'package:movies_application/features/onboarding/presentation/cubit/onboarding_cubit.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<AuthenticationCubit>(() => AuthenticationCubit());
  sl.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  sl.registerFactory<MoviesListsCubit>(
    () => MoviesListsCubit(
      getNowPlayingUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetNowPlayingUsecase>(
    () => GetNowPlayingUsecase(getNowPlayingRepo: sl()),
  );

  // Repository
  sl.registerLazySingleton<GetNowPlayingRepo>(
    () => GetNowPlayingRepoImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<NowPlayingRemoteDataSource>(
    () => NowPlayingRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  //! External

  () => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      );
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
