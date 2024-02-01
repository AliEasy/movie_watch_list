// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_watch_list/configureDependencies.dart' as _i9;
import 'package:movie_watch_list/feature/movie/data/data_sources/remote/movies_api_service.dart'
    as _i4;
import 'package:movie_watch_list/feature/movie/data/repository/movie_repository_impl.dart'
    as _i6;
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart'
    as _i5;
import 'package:movie_watch_list/feature/movie/domain/usecases/get_movie.dart'
    as _i7;
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_bloc.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.factory<_i4.MoviesApiService>(() => _i4.MoviesApiService(gh<_i3.Dio>()));
    gh.factory<_i5.MovieRepository>(
        () => _i6.MovieRepositoryImpl(gh<_i4.MoviesApiService>()));
    gh.factory<_i7.GetMovieUseCase>(
        () => _i7.GetMovieUseCase(gh<_i5.MovieRepository>()));
    gh.factory<_i8.RemoteMovieBloc>(
        () => _i8.RemoteMovieBloc(gh<_i7.GetMovieUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
