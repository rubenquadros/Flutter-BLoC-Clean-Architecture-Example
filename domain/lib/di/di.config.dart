// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/cast_repository.dart' as _i10;
import '../repository/config_repository.dart' as _i8;
import '../repository/details_repository.dart' as _i12;
import '../repository/movies_repository.dart' as _i4;
import '../repository/person_repository.dart' as _i16;
import '../repository/shows_repository.dart' as _i6;
import '../repository/trending_repository.dart' as _i24;
import '../repository/video_repository.dart' as _i14;
import '../usecase/cast/movie_cast_use_case.dart' as _i9;
import '../usecase/cast/show_cast_use_case.dart' as _i20;
import '../usecase/details/movie_details_use_case.dart' as _i11;
import '../usecase/details/show_details_use_case.dart' as _i21;
import '../usecase/get_config_use_case.dart' as _i7;
import '../usecase/movies/current_playing_movies_use_case.dart' as _i3;
import '../usecase/movies/popular_movies_use_case.dart' as _i18;
import '../usecase/person/person_credits_use_case.dart' as _i15;
import '../usecase/person/person_info_use_case.dart' as _i17;
import '../usecase/shows/current_playing_shows_use_case.dart' as _i5;
import '../usecase/shows/popular_shows_use_case.dart' as _i19;
import '../usecase/trending/trending_movies_use_case.dart' as _i23;
import '../usecase/trending/trending_people_use_case.dart' as _i25;
import '../usecase/trending/trending_shows_use_case.dart' as _i26;
import '../usecase/video/movie_trailer_use_case.dart' as _i13;
import '../usecase/video/show_trailer_use_case.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CurrentPlayingMoviesUseCase>(
      () => _i3.CurrentPlayingMoviesUseCase(get<_i4.MoviesRepository>()));
  gh.factory<_i5.CurrentPlayingShowsUseCase>(
      () => _i5.CurrentPlayingShowsUseCase(get<_i6.ShowsRepository>()));
  gh.factory<_i7.GetConfigUseCase>(
      () => _i7.GetConfigUseCase(get<_i8.ConfigRepository>()));
  gh.factory<_i9.MovieCastUseCase>(
      () => _i9.MovieCastUseCase(get<_i10.CastRepository>()));
  gh.factory<_i11.MovieDetailsUseCase>(
      () => _i11.MovieDetailsUseCase(get<_i12.DetailsRepository>()));
  gh.factory<_i13.MovieTrailerUseCase>(
      () => _i13.MovieTrailerUseCase(get<_i14.VideoRepository>()));
  gh.factory<_i15.PersonCreditsUseCase>(
      () => _i15.PersonCreditsUseCase(get<_i16.PersonRepository>()));
  gh.factory<_i17.PersonInfoUseCase>(
      () => _i17.PersonInfoUseCase(get<_i16.PersonRepository>()));
  gh.factory<_i18.PopularMoviesUseCase>(
      () => _i18.PopularMoviesUseCase(get<_i4.MoviesRepository>()));
  gh.factory<_i19.PopularShowsUseCase>(
      () => _i19.PopularShowsUseCase(get<_i6.ShowsRepository>()));
  gh.factory<_i20.ShowCastUseCase>(
      () => _i20.ShowCastUseCase(get<_i10.CastRepository>()));
  gh.factory<_i21.ShowDetailsUseCase>(
      () => _i21.ShowDetailsUseCase(get<_i12.DetailsRepository>()));
  gh.factory<_i22.ShowTrailerUseCase>(
      () => _i22.ShowTrailerUseCase(get<_i14.VideoRepository>()));
  gh.factory<_i23.TrendingMoviesUseCase>(
      () => _i23.TrendingMoviesUseCase(get<_i24.TrendingRepository>()));
  gh.factory<_i25.TrendingPeopleUseCase>(
      () => _i25.TrendingPeopleUseCase(get<_i24.TrendingRepository>()));
  gh.factory<_i26.TrendingShowsUseCase>(
      () => _i26.TrendingShowsUseCase(get<_i24.TrendingRepository>()));
  return get;
}
