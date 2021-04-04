import 'package:domain/model/trending_record.dart';
import 'package:domain/model/trending_people_record.dart';

abstract class TrendingState {}

class InitialTrendingMoviesShowsState extends TrendingState {}

class SuccessTrendingMoviesState extends TrendingState {
  final TrendingRecord record;

  SuccessTrendingMoviesState(this.record);
}

class SuccessTrendingShowsState extends TrendingState {
  final TrendingRecord record;

  SuccessTrendingShowsState(this.record);
}

class SuccessTrendingPersonState extends TrendingState {
  final TrendingPeopleRecord record;

  SuccessTrendingPersonState(this.record);
}

class ErrorMoviesShowsState extends TrendingState {}
