// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/config_repository.dart' as _i4;
import '../repository/details_repository.dart' as _i6;
import '../repository/trending_repository.dart' as _i9;
import '../usecase/details/movie_details_use_case.dart' as _i5;
import '../usecase/details/show_details_use_case.dart' as _i7;
import '../usecase/get_config_use_case.dart' as _i3;
import '../usecase/trending/trending_movies_use_case.dart' as _i8;
import '../usecase/trending/trending_people_use_case.dart' as _i10;
import '../usecase/trending/trending_shows_use_case.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetConfigUseCase>(
      () => _i3.GetConfigUseCase(get<_i4.ConfigRepository>()));
  gh.factory<_i5.MovieDetailsUseCase>(
      () => _i5.MovieDetailsUseCase(get<_i6.DetailsRepository>()));
  gh.factory<_i7.ShowDetailsUseCase>(
      () => _i7.ShowDetailsUseCase(get<_i6.DetailsRepository>()));
  gh.factory<_i8.TrendingMoviesUseCase>(
      () => _i8.TrendingMoviesUseCase(get<_i9.TrendingRepository>()));
  gh.factory<_i10.TrendingPeopleUseCase>(
      () => _i10.TrendingPeopleUseCase(get<_i9.TrendingRepository>()));
  gh.factory<_i11.TrendingShowsUseCase>(
      () => _i11.TrendingShowsUseCase(get<_i9.TrendingRepository>()));
  return get;
}
