// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/cast_repository.dart' as _i6;
import '../repository/config_repository.dart' as _i4;
import '../repository/details_repository.dart' as _i8;
import '../repository/person_repository.dart' as _i12;
import '../repository/trending_repository.dart' as _i18;
import '../repository/video_repository.dart' as _i10;
import '../usecase/cast/movie_cast_use_case.dart' as _i5;
import '../usecase/cast/show_cast_use_case.dart' as _i14;
import '../usecase/details/movie_details_use_case.dart' as _i7;
import '../usecase/details/show_details_use_case.dart' as _i15;
import '../usecase/get_config_use_case.dart' as _i3;
import '../usecase/person/person_credits_use_case.dart' as _i11;
import '../usecase/person/person_info_use_case.dart' as _i13;
import '../usecase/trending/trending_movies_use_case.dart' as _i17;
import '../usecase/trending/trending_people_use_case.dart' as _i19;
import '../usecase/trending/trending_shows_use_case.dart' as _i20;
import '../usecase/video/movie_trailer_use_case.dart' as _i9;
import '../usecase/video/show_trailer_use_case.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i11.PersonCreditsUseCase>(
      () => _i11.PersonCreditsUseCase(get<_i12.PersonRepository>()));
  gh.factory<_i13.PersonInfoUseCase>(
      () => _i13.PersonInfoUseCase(get<_i12.PersonRepository>()));
  gh.factory<_i14.ShowCastUseCase>(
      () => _i14.ShowCastUseCase(get<_i6.CastRepository>()));
  gh.factory<_i15.ShowDetailsUseCase>(
      () => _i15.ShowDetailsUseCase(get<_i8.DetailsRepository>()));
  gh.factory<_i16.ShowTrailerUseCase>(
      () => _i16.ShowTrailerUseCase(get<_i10.VideoRepository>()));
  gh.factory<_i17.TrendingMoviesUseCase>(
      () => _i17.TrendingMoviesUseCase(get<_i18.TrendingRepository>()));
  gh.factory<_i19.TrendingPeopleUseCase>(
      () => _i19.TrendingPeopleUseCase(get<_i18.TrendingRepository>()));
  gh.factory<_i20.TrendingShowsUseCase>(
      () => _i20.TrendingShowsUseCase(get<_i18.TrendingRepository>()));
  return get;
}
