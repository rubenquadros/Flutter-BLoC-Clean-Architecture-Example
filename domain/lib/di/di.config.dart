// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/cast_repository.dart' as _i6;
import '../repository/config_repository.dart' as _i4;
import '../repository/details_repository.dart' as _i8;
import '../repository/trending_repository.dart' as _i15;
import '../repository/video_repository.dart' as _i10;
import '../usecase/cast/movie_cast_use_case.dart' as _i5;
import '../usecase/cast/show_cast_use_case.dart' as _i11;
import '../usecase/details/movie_details_use_case.dart' as _i7;
import '../usecase/details/show_details_use_case.dart' as _i12;
import '../usecase/get_config_use_case.dart' as _i3;
import '../usecase/trending/trending_movies_use_case.dart' as _i14;
import '../usecase/trending/trending_people_use_case.dart' as _i16;
import '../usecase/trending/trending_shows_use_case.dart' as _i17;
import '../usecase/video/movie_trailer_use_case.dart' as _i9;
import '../usecase/video/show_trailer_use_case.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetConfigUseCase>(
      () => _i3.GetConfigUseCase(get<_i4.ConfigRepository>()));
  gh.factory<_i5.MovieCastUseCase>(
      () => _i5.MovieCastUseCase(get<_i6.CastRepository>()));
  gh.factory<_i7.MovieDetailsUseCase>(
      () => _i7.MovieDetailsUseCase(get<_i8.DetailsRepository>()));
  gh.factory<_i9.MovieTrailerUseCase>(
      () => _i9.MovieTrailerUseCase(get<_i10.VideoRepository>()));
  gh.factory<_i11.ShowCastUseCase>(
      () => _i11.ShowCastUseCase(get<_i6.CastRepository>()));
  gh.factory<_i12.ShowDetailsUseCase>(
      () => _i12.ShowDetailsUseCase(get<_i8.DetailsRepository>()));
  gh.factory<_i13.ShowTrailerUseCase>(
      () => _i13.ShowTrailerUseCase(get<_i10.VideoRepository>()));
  gh.factory<_i14.TrendingMoviesUseCase>(
      () => _i14.TrendingMoviesUseCase(get<_i15.TrendingRepository>()));
  gh.factory<_i16.TrendingPeopleUseCase>(
      () => _i16.TrendingPeopleUseCase(get<_i15.TrendingRepository>()));
  gh.factory<_i17.TrendingShowsUseCase>(
      () => _i17.TrendingShowsUseCase(get<_i15.TrendingRepository>()));
  return get;
}
