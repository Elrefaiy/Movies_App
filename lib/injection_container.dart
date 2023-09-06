import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_application/features/movies/data/datasources/movie_details_remote.dart';
import 'package:movies_application/features/movies/data/datasources/movie_videos_remote.dart';
import 'package:movies_application/features/movies/data/repositories/get_movie_details_repo_impl.dart';
import 'package:movies_application/features/movies/domain/repositories/get_movie_details.dart';
import 'package:movies_application/features/movies/domain/repositories/get_movie_videos_repo.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_videos.dart';
import 'package:movies_application/features/movies/presentation/cubit/movies_cubit.dart';
import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/authentication/presentation/cubit/authentication_cubit.dart';
import 'features/movies/data/repositories/get_movie_videos_repo_impl.dart';
import 'features/movies_lists/data/datasources/popular_remote.dart';
import 'features/movies_lists/data/datasources/now_playing_remote.dart';
import 'features/movies_lists/data/datasources/upcoming_remote.dart';
import 'features/movies_lists/data/repositories/get_now_playing_repo_impl.dart';
import 'features/movies_lists/data/repositories/get_popular_repo_impl.dart';
import 'features/movies_lists/data/repositories/get_top_rated_repo_impl.dart';
import 'features/movies_lists/data/repositories/get_upcoming_repo_impl.dart';
import 'features/movies_lists/domain/repositories/get_now_playing.dart';
import 'features/movies_lists/domain/repositories/get_popular.dart';
import 'features/movies_lists/domain/repositories/get_top_rated.dart';
import 'features/movies_lists/domain/repositories/get_upcoming.dart';
import 'features/movies_lists/domain/usecases/get_now_playing_usecase.dart';
import 'features/movies_lists/domain/usecases/get_popular_usecase.dart';
import 'features/movies_lists/domain/usecases/get_top_rated_usecase.dart';
import 'features/movies_lists/domain/usecases/get_upcoming_usecase.dart';
import 'features/movies_lists/presentation/cubit/movies_lists_cubit.dart';
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart';

import 'core/network/network_info.dart';
import 'features/movies_lists/data/datasources/top_rated_remote.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<AuthenticationCubit>(() => AuthenticationCubit());
  sl.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  sl.registerFactory<MoviesListsCubit>(
    () => MoviesListsCubit(
      getNowPlayingUsecase: sl(),
      getPopularUsecase: sl(),
      getTopRatedUsecase: sl(),
      getUpcomingUsecase: sl(),
    ),
  );
  sl.registerFactory<MoviesCubit>(
    () => MoviesCubit(
      getMovieDetailsUsecase: sl(),
      getMovieVideosUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetNowPlayingUsecase>(
    () => GetNowPlayingUsecase(getNowPlayingRepo: sl()),
  );
  sl.registerLazySingleton<GetPopularUsecase>(
    () => GetPopularUsecase(getPopularRepo: sl()),
  );
  sl.registerLazySingleton<GetTopRatedUsecase>(
    () => GetTopRatedUsecase(getTopRatedRepo: sl()),
  );
  sl.registerLazySingleton<GetUpcomingUsecase>(
    () => GetUpcomingUsecase(getUpcomingRepo: sl()),
  );

  sl.registerLazySingleton<GetMovieDetailsUsecase>(
    () => GetMovieDetailsUsecase(getMovieDetailsRepo: sl()),
  );

  sl.registerLazySingleton<GetMovieVideosUsecase>(
    () => GetMovieVideosUsecase(getMovieVideosRepo: sl()),
  );

  // Repository
  sl.registerLazySingleton<GetNowPlayingRepo>(
    () => GetNowPlayingRepoImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<GetPopularRepo>(
    () => GetPopularRepoImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<GetTopRatedRepo>(
    () => GetTopRatedRepoImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<GetUpcomingRepo>(
    () => GetUpcomingRepoImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<GetMovieDetailsRepo>(
    () => GetMovieDetailsRepoImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<GetMovieVideosRepo>(
    () => GetMovieVideosRepoImpl(
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
  sl.registerLazySingleton<PopularRemoteDataSource>(
    () => PopularRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );
  sl.registerLazySingleton<TopRatedRemoteDataSource>(
    () => TopRatedRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );
  sl.registerLazySingleton<UpcomingRemoteDataSource>(
    () => UpcomingRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );

  sl.registerLazySingleton<MovieDetailsRemoteDataSource>(
    () => MovieDetailsRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );

  sl.registerLazySingleton<MovieVideosRemoteDataSource>(
    () => MovieVideosRemoteImpl(
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
