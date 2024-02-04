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
import 'package:movie_watch_list/configureDependencies.dart' as _i11;
import 'package:movie_watch_list/feature/movie/data/data_sources/remote/movie_api_service.dart'
    as _i4;
import 'package:movie_watch_list/feature/movie/data/repository/movie_repository_impl.dart'
    as _i6;
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart'
    as _i5;
import 'package:movie_watch_list/feature/movie/domain/usecases/movie_details.dart'
    as _i7;
import 'package:movie_watch_list/feature/movie/domain/usecases/movie_list.dart'
    as _i8;
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_details/movie_details_bloc.dart'
    as _i9;
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_bloc.dart'
    as _i10;

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
    gh.factory<_i4.MovieApiService>(() => _i4.MovieApiService(gh<_i3.Dio>()));
    gh.factory<_i5.MovieRepository>(
        () => _i6.MovieRepositoryImpl(gh<_i4.MovieApiService>()));
    gh.factory<_i7.MovieDetailsUseCase>(
        () => _i7.MovieDetailsUseCase(gh<_i5.MovieRepository>()));
    gh.factory<_i8.MovieListUseCase>(
        () => _i8.MovieListUseCase(gh<_i5.MovieRepository>()));
    gh.factory<_i9.MovieDetailsBloc>(
        () => _i9.MovieDetailsBloc(gh<_i7.MovieDetailsUseCase>()));
    gh.factory<_i10.MovieListBloc>(
        () => _i10.MovieListBloc(gh<_i8.MovieListUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
