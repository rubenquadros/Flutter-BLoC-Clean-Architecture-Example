import 'package:domain/model/movies_shows_record.dart';

abstract class MoviesShowsSearchState {}

class InitialMoviesShowsSearchState extends MoviesShowsSearchState {}

class ProgressMoviesShowsSearchState extends MoviesShowsSearchState {}

class SuccessSuggestionsMoviesShowsState extends MoviesShowsSearchState {
  final MoviesShowsRecord record;

  SuccessSuggestionsMoviesShowsState(this.record);
}

class ErrorMoviesShowsSearchState extends MoviesShowsSearchState {}
