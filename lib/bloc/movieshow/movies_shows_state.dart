import 'package:domain/model/movies_shows_record.dart';

abstract class MoviesShowsState {}

class InitialMoviesShowsState extends MoviesShowsState {}

class SuccessMoviesShowsState extends MoviesShowsState {
  final MoviesShowsRecord record;

  SuccessMoviesShowsState(this.record);
}

class ErrorMoviesShowsState extends MoviesShowsState {}
