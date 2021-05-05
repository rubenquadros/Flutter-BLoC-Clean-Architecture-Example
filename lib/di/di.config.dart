// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/usecase/cast/movie_cast_use_case.dart' as _i4;
import 'package:domain/usecase/cast/show_cast_use_case.dart' as _i5;
import 'package:domain/usecase/details/movie_details_use_case.dart' as _i7;
import 'package:domain/usecase/details/show_details_use_case.dart' as _i8;
import 'package:domain/usecase/filter/movie_filter_use_case.dart' as _i26;
import 'package:domain/usecase/filter/show_filter_use_case.dart' as _i27;
import 'package:domain/usecase/movies/current_playing_movies_use_case.dart'
    as _i13;
import 'package:domain/usecase/movies/latest_movies_use_case.dart' as _i15;
import 'package:domain/usecase/movies/movies_by_genres_use_case.dart' as _i18;
import 'package:domain/usecase/movies/popular_movies_use_case.dart' as _i14;
import 'package:domain/usecase/movies/top_rated_movies_use_case.dart' as _i16;
import 'package:domain/usecase/movies/upcoming_movies_use_case.dart' as _i17;
import 'package:domain/usecase/person/person_credits_use_case.dart' as _i32;
import 'package:domain/usecase/person/person_info_use_case.dart' as _i31;
import 'package:domain/usecase/search_movies_shows_use_case.dart' as _i29;
import 'package:domain/usecase/shows/airing_today_shows_use_case.dart' as _i23;
import 'package:domain/usecase/shows/current_playing_shows_use_case.dart'
    as _i19;
import 'package:domain/usecase/shows/latest_shows_use_case.dart' as _i21;
import 'package:domain/usecase/shows/popular_shows_use_case.dart' as _i20;
import 'package:domain/usecase/shows/shows_by_genres_use_case.dart' as _i24;
import 'package:domain/usecase/shows/top_rated_shows_use_case.dart' as _i22;
import 'package:domain/usecase/trending/trending_movies_use_case.dart' as _i34;
import 'package:domain/usecase/trending/trending_people_use_case.dart' as _i36;
import 'package:domain/usecase/trending/trending_shows_use_case.dart' as _i35;
import 'package:domain/usecase/video/movie_trailer_use_case.dart' as _i10;
import 'package:domain/usecase/video/show_trailer_use_case.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/all/trending_bloc.dart' as _i33;
import '../bloc/cast/movie_show_cast_bloc.dart' as _i3;
import '../bloc/details/movie_show_details_bloc.dart' as _i6;
import '../bloc/filter/movies_shows_filter_bloc.dart' as _i25;
import '../bloc/movieshow/movies_shows_bloc.dart' as _i12;
import '../bloc/person/person_details_bloc.dart' as _i30;
import '../bloc/search/movies_shows_search_bloc.dart' as _i28;
import '../bloc/video/movie_show_trailer_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.MovieShowCastBloc>(() => _i3.MovieShowCastBloc(
      get<_i4.MovieCastUseCase>(), get<_i5.ShowCastUseCase>()));
  gh.factory<_i6.MovieShowDetailsBloc>(() => _i6.MovieShowDetailsBloc(
      get<_i7.MovieDetailsUseCase>(), get<_i8.ShowDetailsUseCase>()));
  gh.factory<_i9.MovieShowTrailerBloc>(() => _i9.MovieShowTrailerBloc(
      get<_i10.MovieTrailerUseCase>(), get<_i11.ShowTrailerUseCase>()));
  gh.factory<_i12.MoviesShowsBloc>(() => _i12.MoviesShowsBloc(
      get<_i13.CurrentPlayingMoviesUseCase>(),
      get<_i14.PopularMoviesUseCase>(),
      get<_i15.LatestMoviesUseCase>(),
      get<_i16.TopRatedMoviesUseCase>(),
      get<_i17.UpcomingMoviesUseCase>(),
      get<_i18.MoviesByGenresUseCase>(),
      get<_i19.CurrentPlayingShowsUseCase>(),
      get<_i20.PopularShowsUseCase>(),
      get<_i21.LatestShowsUseCase>(),
      get<_i22.TopRatedShowsUseCase>(),
      get<_i23.AiringTodayShowsUseCase>(),
      get<_i24.ShowsByGenresUseCase>()));
  gh.factory<_i25.MoviesShowsFilterBloc>(() => _i25.MoviesShowsFilterBloc(
      get<_i26.MovieFilterUseCase>(), get<_i27.ShowFilterUseCase>()));
  gh.factory<_i28.MoviesShowsSearchBloc>(
      () => _i28.MoviesShowsSearchBloc(get<_i29.SearchMoviesShowsUseCase>()));
  gh.factory<_i30.PersonDetailsBloc>(() => _i30.PersonDetailsBloc(
      get<_i31.PersonInfoUseCase>(), get<_i32.PersonCreditsUseCase>()));
  gh.factory<_i33.TrendingBloc>(() => _i33.TrendingBloc(
      get<_i34.TrendingMoviesUseCase>(),
      get<_i35.TrendingShowsUseCase>(),
      get<_i36.TrendingPeopleUseCase>()));
  return get;
}
