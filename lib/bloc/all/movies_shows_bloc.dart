import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/usecase/trending_movies_shows_use_case.dart';
import 'package:injectable/injectable.dart';
import 'movies_shows_event.dart';
import 'movies_shows_state.dart';

@injectable
class MoviesShowsBloc extends Bloc<MoviesShowsEvent, MoviesShowsState> {

  final TrendingMoviesShowsUseCase useCase;

  MoviesShowsBloc(this.useCase) : super(InitialMoviesShowsState());

  @override
  Stream<MoviesShowsState> mapEventToState(MoviesShowsEvent event) async* {
    switch (event) {
      case MoviesShowsEvent.all:
        yield* _fetchMoviesShows(event);
        break;
      case MoviesShowsEvent.movies:
        break;
      case MoviesShowsEvent.tv:
        break;
      default:
        break;
    }
  }

  Stream<MoviesShowsState> _fetchMoviesShows(MoviesShowsEvent event) async* {
    try {
      var response =
          await useCase.getTrendingMoviesShows(type: event.toString());
      yield SuccessMoviesShowsState(MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsState();
    }
  }
}
