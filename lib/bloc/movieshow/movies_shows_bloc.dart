import 'package:domain/model/movies_shows_record.dart';
import 'package:domain/usecase/movies/current_playing_movies_use_case.dart';
import 'package:domain/usecase/movies/popular_movies_use_case.dart';
import 'package:domain/usecase/shows/current_playing_shows_use_case.dart';
import 'package:domain/usecase/shows/popular_shows_use_case.dart';
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
  final CurrentPlayingShowsUseCase currentPlayingShowsUseCase;
  final PopularShowsUseCase popularShowsUseCase;

  MoviesShowsBloc(this.currentPlayingMoviesUseCase, this.popularMoviesUseCase,
      this.currentPlayingShowsUseCase, this.popularShowsUseCase)
      : super(InitialMoviesShowsState());

  @override
  Stream<MoviesShowsState> mapEventToState(MoviesShowsEvent event) async* {
    if (event.type == AppConstants.movie) {
      switch (event.event) {
        case AppConstants.currentlyPlaying:
          yield* _fetchCurrentPlayingMovies();
          break;
        case AppConstants.topRated:
          yield* _fetchPopularMovies(event.type, event.page);
          break;
        default:
          break;
      }
    } else {
      switch (event.event) {
        case AppConstants.currentlyPlaying:
          yield* _fetchCurrentPlayingShows();
          break;
        case AppConstants.topRated:
          yield* _fetchPopularShows(event.type, event.page);
          break;
        default:
          break;
      }
    }
  }

  Stream<MoviesShowsState> _fetchCurrentPlayingMovies() async* {
    try {
      var response =
          await currentPlayingMoviesUseCase.getCurrentPlayingMovies();
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

  Stream<MoviesShowsState> _fetchCurrentPlayingShows() async* {
    try {
      var response = await currentPlayingShowsUseCase.getCurrentPlayingShows();
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
}
