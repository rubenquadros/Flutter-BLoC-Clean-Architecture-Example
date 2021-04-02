// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/config_repository.dart' as _i4;
import '../repository/repository.dart' as _i6;
import '../usecase/get_config_use_case.dart' as _i3;
import '../usecase/trending_movies_shows_use_case.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetConfigUseCase>(
      () => _i3.GetConfigUseCase(get<_i4.ConfigRepository>()));
  gh.factory<_i5.TrendingMoviesShowsUseCase>(
      () => _i5.TrendingMoviesShowsUseCase(get<_i6.Repository>()));
  return get;
}
