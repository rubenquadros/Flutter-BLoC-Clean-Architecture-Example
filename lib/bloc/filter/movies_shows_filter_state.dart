import 'package:domain/model/movie_show_genres_record.dart';

abstract class MoviesShowsFilterState {}

class InitialMoviesShowsFilterState extends MoviesShowsFilterState {}

class SuccessMoviesShowsFilterState extends MoviesShowsFilterState {
  final MovieShowGenresRecord record;

  SuccessMoviesShowsFilterState(this.record);
}

class ErrorMoviesShowsFilterState extends MoviesShowsFilterState {}
