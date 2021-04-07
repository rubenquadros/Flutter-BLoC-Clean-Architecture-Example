// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/repository/cast_repository.dart' as _i3;
import 'package:domain/repository/config_repository.dart' as _i6;
import 'package:domain/repository/details_repository.dart' as _i8;
import 'package:domain/repository/trending_repository.dart' as _i10;
import 'package:domain/repository/video_repository.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:remote/datasource/movies_shows_data_source.dart' as _i5;

import '../repository/cast_repository_impl.dart' as _i4;
import '../repository/config_repository_impl.dart' as _i7;
import '../repository/details_repository_impl.dart' as _i9;
import '../repository/trending_repository_impl.dart' as _i11;
import '../repository/video_repository_impl.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.CastRepository>(
      _i4.CastRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i6.ConfigRepository>(
      _i7.ConfigRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i8.DetailsRepository>(
      _i9.DetailsRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i10.TrendingRepository>(
      _i11.TrendingRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i12.VideoRepository>(
      _i13.VideoRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  return get;
}
