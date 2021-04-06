import 'package:domain/model/movie_details_record.dart';
import 'package:domain/model/show_details_record.dart';

abstract class MovieShowDetailsState {}

class InitialMovieShowDetailsState extends MovieShowDetailsState {}

class SuccessMovieDetailsState extends MovieShowDetailsState {
  final MovieDetailsRecord record;

  SuccessMovieDetailsState(this.record);
}

class SuccessShowDetailsState extends MovieShowDetailsState {
  final ShowDetailsRecord record;

  SuccessShowDetailsState(this.record);
}

class ErrorMovieShowDetailsState extends MovieShowDetailsState {}
