import 'package:domain/model/cast_record.dart';

abstract class MovieShowCastState {}

class InitialMovieShowCastState extends MovieShowCastState {}

class SuccessMovieShowCastState extends MovieShowCastState {
  final CastRecord record;

  SuccessMovieShowCastState(this.record);
}

class ErrorMovieShowCastState extends MovieShowCastState {}
