// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/cast_repository.dart' as _i13;
import '../repository/config_repository.dart' as _i9;
import '../repository/details_repository.dart' as _i15;
import '../repository/filter_repository.dart' as _i17;
import '../repository/movies_repository.dart' as _i6;
import '../repository/person_repository.dart' as _i22;
import '../repository/search_repository.dart' as _i27;
import '../repository/shows_repository.dart' as _i4;
import '../repository/trending_repository.dart' as _i36;
import '../repository/video_repository.dart' as _i19;
import '../usecase/cast/movie_cast_use_case.dart' as _i12;
import '../usecase/cast/show_cast_use_case.dart' as _i28;
import '../usecase/details/movie_details_use_case.dart' as _i14;
import '../usecase/details/show_details_use_case.dart' as _i29;
import '../usecase/filter/movie_filter_use_case.dart' as _i16;
import '../usecase/filter/show_filter_use_case.dart' as _i30;
import '../usecase/get_config_use_case.dart' as _i8;
import '../usecase/movies/current_playing_movies_use_case.dart' as _i5;
import '../usecase/movies/latest_movies_use_case.dart' as _i10;
import '../usecase/movies/movies_by_genres_use_case.dart' as _i20;
import '../usecase/movies/popular_movies_use_case.dart' as _i24;
import '../usecase/movies/top_rated_movies_use_case.dart' as _i33;
import '../usecase/movies/upcoming_movies_use_case.dart' as _i39;
import '../usecase/person/person_credits_use_case.dart' as _i21;
import '../usecase/person/person_info_use_case.dart' as _i23;
import '../usecase/search_movies_shows_use_case.dart' as _i26;
import '../usecase/shows/airing_today_shows_use_case.dart' as _i3;
import '../usecase/shows/current_playing_shows_use_case.dart' as _i7;
import '../usecase/shows/latest_shows_use_case.dart' as _i11;
import '../usecase/shows/popular_shows_use_case.dart' as _i25;
import '../usecase/shows/shows_by_genres_use_case.dart' as _i32;
import '../usecase/shows/top_rated_shows_use_case.dart' as _i34;
import '../usecase/trending/trending_movies_use_case.dart' as _i35;
import '../usecase/trending/trending_people_use_case.dart' as _i37;
import '../usecase/trending/trending_shows_use_case.dart' as _i38;
import '../usecase/video/movie_trailer_use_case.dart' as _i18;
import '../usecase/video/show_trailer_use_case.dart'
    as _i31; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AiringTodayShowsUseCase>(
      () => _i3.AiringTodayShowsUseCase(get<_i4.ShowsRepository>()));
  gh.factory<_i5.CurrentPlayingMoviesUseCase>(
      () => _i5.CurrentPlayingMoviesUseCase(get<_i6.MoviesRepository>()));
  gh.factory<_i7.CurrentPlayingShowsUseCase>(
      () => _i7.CurrentPlayingShowsUseCase(get<_i4.ShowsRepository>()));
  gh.factory<_i8.GetConfigUseCase>(
      () => _i8.GetConfigUseCase(get<_i9.ConfigRepository>()));
  gh.factory<_i10.LatestMoviesUseCase>(
      () => _i10.LatestMoviesUseCase(get<_i6.MoviesRepository>()));
  gh.factory<_i11.LatestShowsUseCase>(
      () => _i11.LatestShowsUseCase(get<_i4.ShowsRepository>()));
  gh.factory<_i12.MovieCastUseCase>(
      () => _i12.MovieCastUseCase(get<_i13.CastRepository>()));
  gh.factory<_i14.MovieDetailsUseCase>(
      () => _i14.MovieDetailsUseCase(get<_i15.DetailsRepository>()));
  gh.factory<_i16.MovieFilterUseCase>(
      () => _i16.MovieFilterUseCase(get<_i17.FilterRepository>()));
  gh.factory<_i18.MovieTrailerUseCase>(
      () => _i18.MovieTrailerUseCase(get<_i19.VideoRepository>()));
  gh.factory<_i20.MoviesByGenresUseCase>(
      () => _i20.MoviesByGenresUseCase(get<_i6.MoviesRepository>()));
  gh.factory<_i21.PersonCreditsUseCase>(
      () => _i21.PersonCreditsUseCase(get<_i22.PersonRepository>()));
  gh.factory<_i23.PersonInfoUseCase>(
      () => _i23.PersonInfoUseCase(get<_i22.PersonRepository>()));
  gh.factory<_i24.PopularMoviesUseCase>(
      () => _i24.PopularMoviesUseCase(get<_i6.MoviesRepository>()));
  gh.factory<_i25.PopularShowsUseCase>(
      () => _i25.PopularShowsUseCase(get<_i4.ShowsRepository>()));
  gh.factory<_i26.SearchMoviesShowsUseCase>(
      () => _i26.SearchMoviesShowsUseCase(get<_i27.SearchRepository>()));
  gh.factory<_i28.ShowCastUseCase>(
      () => _i28.ShowCastUseCase(get<_i13.CastRepository>()));
  gh.factory<_i29.ShowDetailsUseCase>(
      () => _i29.ShowDetailsUseCase(get<_i15.DetailsRepository>()));
  gh.factory<_i30.ShowFilterUseCase>(
      () => _i30.ShowFilterUseCase(get<_i17.FilterRepository>()));
  gh.factory<_i31.ShowTrailerUseCase>(
      () => _i31.ShowTrailerUseCase(get<_i19.VideoRepository>()));
  gh.factory<_i32.ShowsByGenresUseCase>(
      () => _i32.ShowsByGenresUseCase(get<_i4.ShowsRepository>()));
  gh.factory<_i33.TopRatedMoviesUseCase>(
      () => _i33.TopRatedMoviesUseCase(get<_i6.MoviesRepository>()));
  gh.factory<_i34.TopRatedShowsUseCase>(
      () => _i34.TopRatedShowsUseCase(get<_i4.ShowsRepository>()));
  gh.factory<_i35.TrendingMoviesUseCase>(
      () => _i35.TrendingMoviesUseCase(get<_i36.TrendingRepository>()));
  gh.factory<_i37.TrendingPeopleUseCase>(
      () => _i37.TrendingPeopleUseCase(get<_i36.TrendingRepository>()));
  gh.factory<_i38.TrendingShowsUseCase>(
      () => _i38.TrendingShowsUseCase(get<_i36.TrendingRepository>()));
  gh.factory<_i39.UpcomingMoviesUseCase>(
      () => _i39.UpcomingMoviesUseCase(get<_i6.MoviesRepository>()));
  return get;
}
