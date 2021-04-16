// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/repository/cast_repository.dart' as _i3;
import 'package:domain/repository/config_repository.dart' as _i6;
import 'package:domain/repository/details_repository.dart' as _i8;
import 'package:domain/repository/movies_repository.dart' as _i10;
import 'package:domain/repository/person_repository.dart' as _i12;
import 'package:domain/repository/shows_repository.dart' as _i14;
import 'package:domain/repository/trending_repository.dart' as _i16;
import 'package:domain/repository/video_repository.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:remote/datasource/movies_shows_data_source.dart' as _i5;

import '../repository/cast_repository_impl.dart' as _i4;
import '../repository/config_repository_impl.dart' as _i7;
import '../repository/details_repository_impl.dart' as _i9;
import '../repository/movies_repository_impl.dart' as _i11;
import '../repository/person_repository_impl.dart' as _i13;
import '../repository/shows_repository_impl.dart' as _i15;
import '../repository/trending_repository_impl.dart' as _i17;
import '../repository/video_repository_impl.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i10.MoviesRepository>(
      _i11.MoviesRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i12.PersonRepository>(
      _i13.PersonRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i14.ShowsRepository>(
      _i15.ShowsRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i16.TrendingRepository>(
      _i17.TrendingRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i18.VideoRepository>(
      _i19.VideoRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  return get;
}
