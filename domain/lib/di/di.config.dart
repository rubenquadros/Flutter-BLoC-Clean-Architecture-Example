// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/config_repository.dart' as _i4;
import '../repository/repository.dart' as _i6;
import '../usecase/get_config_use_case.dart' as _i3;
import '../usecase/trending/trending_movies_use_case.dart' as _i5;
import '../usecase/trending/trending_people_use_case.dart' as _i7;
import '../usecase/trending/trending_shows_use_case.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetConfigUseCase>(
      () => _i3.GetConfigUseCase(get<_i4.ConfigRepository>()));
  gh.factory<_i5.TrendingMoviesUseCase>(
      () => _i5.TrendingMoviesUseCase(get<_i6.Repository>()));
  gh.factory<_i7.TrendingPeopleUseCase>(
      () => _i7.TrendingPeopleUseCase(get<_i6.Repository>()));
  gh.factory<_i8.TrendingShowsUseCase>(
      () => _i8.TrendingShowsUseCase(get<_i6.Repository>()));
  return get;
}
