import 'package:domain/model/movies_shows_record.dart';
import 'package:domain/model/trending_people_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/usecase/trending/trending_movies_use_case.dart';
import 'package:domain/usecase/trending/trending_people_use_case.dart';
import 'package:domain/usecase/trending/trending_shows_use_case.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'trending_event.dart';
import 'trending_state.dart';

@injectable
class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingMoviesUseCase trendingMoviesUseCase;
  final TrendingShowsUseCase trendingShowsUseCase;
  final TrendingPeopleUseCase trendingPeopleUseCase;

  TrendingBloc(this.trendingMoviesUseCase, this.trendingShowsUseCase,
      this.trendingPeopleUseCase)
      : super(InitialTrendingMoviesShowsState());

  @override
  Stream<TrendingState> mapEventToState(TrendingEvent event) async* {
    switch (event) {
      case TrendingEvent.movie:
        yield* _fetchTrendingMovies(AppConstants.movie);
        break;
      case TrendingEvent.tv:
        yield* _fetchTrendingShows(AppConstants.tvShow);
        break;
      case TrendingEvent.person:
        yield* _fetchTrendingPeople(AppConstants.person);
        break;
      default:
        break;
    }
  }

  Stream<TrendingState> _fetchTrendingMovies(String type) async* {
    try {
      var response = await trendingMoviesUseCase.getTrendingMovies(type: type);
      yield SuccessTrendingMoviesState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<TrendingState> _fetchTrendingShows(String type) async* {
    try {
      var response = await trendingShowsUseCase.getTrendingShows(type: type);
      yield SuccessTrendingShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }

  Stream<TrendingState> _fetchTrendingPeople(String type) async* {
    try {
      var response = await trendingPeopleUseCase.getTrendingPeople(type: type);
      yield SuccessTrendingPersonState(TrendingPeopleRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }
}
