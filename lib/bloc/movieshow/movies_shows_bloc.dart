import 'package:domain/model/movies_shows_record.dart';
import 'package:domain/usecase/movies/current_playing_movies_use_case.dart';
import 'package:domain/usecase/movies/latest_movies_use_case.dart';
import 'package:domain/usecase/movies/movies_by_genres_use_case.dart';
import 'package:domain/usecase/movies/popular_movies_use_case.dart';
import 'package:domain/usecase/movies/top_rated_movies_use_case.dart';
import 'package:domain/usecase/movies/upcoming_movies_use_case.dart';
import 'package:domain/usecase/shows/airing_today_shows_use_case.dart';
import 'package:domain/usecase/shows/current_playing_shows_use_case.dart';
import 'package:domain/usecase/shows/latest_shows_use_case.dart';
import 'package:domain/usecase/shows/popular_shows_use_case.dart';
import 'package:domain/usecase/shows/shows_by_genres_use_case.dart';
import 'package:domain/usecase/shows/top_rated_shows_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_event.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesShowsBloc extends Bloc<MoviesShowsEvent, MoviesShowsState> {
  final CurrentPlayingMoviesUseCase currentPlayingMoviesUseCase;
  final PopularMoviesUseCase popularMoviesUseCase;
  final LatestMoviesUseCase latestMoviesUseCase;
  final TopRatedMoviesUseCase topRatedMoviesUseCase;
  final UpcomingMoviesUseCase upcomingMoviesUseCase;
  final MoviesByGenresUseCase moviesByGenresUseCase;
  final CurrentPlayingShowsUseCase currentPlayingShowsUseCase;
  final PopularShowsUseCase popularShowsUseCase;
  final LatestShowsUseCase latestShowsUseCase;
  final TopRatedShowsUseCase topRatedShowsUseCase;
  final AiringTodayShowsUseCase airingTodayShowsUseCase;
  final ShowsByGenresUseCase showsByGenresUseCase;

  MoviesShowsBloc(
      this.currentPlayingMoviesUseCase,
      this.popularMoviesUseCase,
      this.latestMoviesUseCase,
      this.topRatedMoviesUseCase,
      this.upcomingMoviesUseCase,
      this.moviesByGenresUseCase,
      this.currentPlayingShowsUseCase,
      this.popularShowsUseCase,
      this.latestShowsUseCase,
      this.topRatedShowsUseCase,
      this.airingTodayShowsUseCase,
      this.showsByGenresUseCase)
      : super(InitialMoviesShowsState());

  @override
  Stream<MoviesShowsState> mapEventToState(MoviesShowsEvent event) async* {
    switch (event.type) {
      case AppConstants.movie:
        if (event.event.contains(AppConstants.sortBy)) {
          final filter = event.event.split(',');
          switch (filter[1]) {
            case AppConstants.popular:
              yield* _fetchPopularMovies(event.type, event.page);
              break;
            case AppConstants.topRated:
              yield* _fetchTopRatedMovies(event.type, event.page);
              break;
            case AppConstants.latest:
              yield* _fetchLatestMovies(event.type, event.page);
              break;
            case AppConstants.nowPlaying:
              yield* _fetchCurrentPlayingMovies(event.page);
              break;
            case AppConstants.upcoming:
              yield* _fetchUpcomingMovies(event.page);
              break;
            default:
              break;
          }
        } else {
          final filter = event.event.split(',');
          yield* _fetchMoviesByGenre(
              event.type, int.parse(filter[1]), event.page);
        }
        break;
      case AppConstants.tvShow:
        if (event.event.contains(AppConstants.sortBy)) {
          final filter = event.event.split(',');
          switch (filter[1]) {
            case AppConstants.popular:
              yield* _fetchPopularShows(event.type, event.page);
              break;
            case AppConstants.topRated:
              yield* _fetchTopRatedShows(event.type, event.page);
              break;
            case AppConstants.latest:
              yield* _fetchLatestShows(event.type, event.page);
              break;
            case AppConstants.onTheAir:
              yield* _fetchCurrentPlayingShows(event.page);
              break;
            case AppConstants.airingToday:
              yield* _fetchAiringTodayShows(event.page);
              break;
            default:
              break;
          }
        } else {
          final filter = event.event.split(',');
          yield* _fetchShowsByGenre(
              event.type, int.parse(filter[1]), event.page);
        }
        break;
      default:
        break;
    }
  }

  Stream<MoviesShowsState> _fetchCurrentPlayingMovies(int page) async* {
    try {
      var response =
          await currentPlayingMoviesUseCase.getCurrentPlayingMovies(page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchPopularMovies(String type, int page) async* {
    try {
      var response =
          await popularMoviesUseCase.getPopularMovies(type: type, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchTopRatedMovies(String type, int page) async* {
    try {
      var response =
          await topRatedMoviesUseCase.getTopRatedMovies(type: type, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchLatestMovies(String type, int page) async* {
    try {
      var response =
          await latestMoviesUseCase.getLatestMovies(type: type, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchUpcomingMovies(int page) async* {
    try {
      var response = await upcomingMoviesUseCase.getUpcomingMovies(page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchMoviesByGenre(
      String type, int genreId, int page) async* {
    try {
      var response = await moviesByGenresUseCase.getMoviesByGenre(
          type: type, genreId: genreId, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchCurrentPlayingShows(int page) async* {
    try {
      var response =
          await currentPlayingShowsUseCase.getCurrentPlayingShows(page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchPopularShows(String type, int page) async* {
    try {
      var response =
          await popularShowsUseCase.getPopularShows(type: type, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchLatestShows(String type, int page) async* {
    try {
      var response =
          await latestShowsUseCase.getLatestShows(type: type, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchTopRatedShows(String type, int page) async* {
    try {
      var response =
          await topRatedShowsUseCase.getTopRatedShows(type: type, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchAiringTodayShows(int page) async* {
    try {
      var response =
          await airingTodayShowsUseCase.getAiringTodayShows(page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<MoviesShowsState> _fetchShowsByGenre(
      String type, int genreId, int page) async* {
    try {
      var response = await showsByGenresUseCase.getShowsByGenres(
          type: type, genreId: genreId, page: page);
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }
}
