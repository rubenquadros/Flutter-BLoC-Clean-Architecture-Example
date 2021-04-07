import 'package:domain/model/trailer_record.dart';

abstract class MovieShowTrailerState {}

class InitialMovieShowTrailerState extends MovieShowTrailerState {}

class SuccessMovieShowTrailerState extends MovieShowTrailerState {
  final TrailerRecord record;

  SuccessMovieShowTrailerState(this.record);
}

class ErrorMovieShowTrailerState extends MovieShowTrailerState {}
