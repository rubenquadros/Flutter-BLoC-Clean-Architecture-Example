import 'package:domain/model/movie_show_genres_record.dart';
import 'package:domain/usecase/filter/movie_filter_use_case.dart';
import 'package:domain/usecase/filter/show_filter_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/filter/movies_shows_filter_event.dart';
import 'package:fun_box/bloc/filter/movies_shows_filter_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesShowsFilterBloc
    extends Bloc<MoviesShowsFilterEvent, MoviesShowsFilterState> {
  final MovieFilterUseCase movieFilterUseCase;
  final ShowFilterUseCase showFilterUseCase;

  MoviesShowsFilterBloc(this.movieFilterUseCase, this.showFilterUseCase)
      : super(InitialMoviesShowsFilterState());

  @override
  Stream<MoviesShowsFilterState> mapEventToState(
      MoviesShowsFilterEvent event) async* {
    switch (event.type) {
      case AppConstants.movie:
        yield* _fetchMovieFilters(event.type);
        break;
      case AppConstants.tvShow:
        yield* _fetchShowFilters(event.type);
        break;
      default:
        break;
    }
  }

  Stream<MoviesShowsFilterState> _fetchMovieFilters(String type) async* {
    try {
      var response = await movieFilterUseCase.getMovieGenres(type: type);
      yield SuccessMoviesShowsFilterState(
          MovieShowGenresRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsFilterState();
    }
  }

  Stream<MoviesShowsFilterState> _fetchShowFilters(String type) async* {
    try {
      var response = await showFilterUseCase.getShowGenres(type: type);
      yield SuccessMoviesShowsFilterState(
          MovieShowGenresRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsFilterState();
    }
  }
}
