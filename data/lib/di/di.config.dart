// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/repository/config_repository.dart' as _i3;
import 'package:domain/repository/repository.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:remote/datasource/movies_shows_data_source.dart' as _i5;

import '../repository/config_repository_impl.dart' as _i4;
import '../repository/repository_impl.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ConfigRepository>(
      _i4.ConfigRepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  gh.singleton<_i6.Repository>(
      _i7.RepositoryImpl(get<_i5.MoviesShowsDataSource>()));
  return get;
}
