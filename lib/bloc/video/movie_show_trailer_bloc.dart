import 'package:domain/model/trailer_record.dart';
import 'package:domain/usecase/video/movie_trailer_use_case.dart';
import 'package:domain/usecase/video/show_trailer_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/video/movie_show_trailer_event.dart';
import 'package:fun_box/bloc/video/movie_show_trailer_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieShowTrailerBloc
    extends Bloc<MovieShowTrailerEvent, MovieShowTrailerState> {
  final MovieTrailerUseCase movieTrailerUseCase;
  final ShowTrailerUseCase showTrailerUseCase;

  MovieShowTrailerBloc(this.movieTrailerUseCase, this.showTrailerUseCase)
      : super(InitialMovieShowTrailerState());

  @override
  Stream<MovieShowTrailerState> mapEventToState(
      MovieShowTrailerEvent event) async* {
    switch (event.type) {
      case AppConstants.movie:
        yield* _fetchMovieTrailer(event.type, event.id);
        break;
      case AppConstants.tvShow:
        yield* _fetchTvShowTrailer(event.type, event.id);
        break;
      default:
        break;
    }
  }

  Stream<MovieShowTrailerState> _fetchMovieTrailer(
      String type, double id) async* {
    try {
      var response =
          await movieTrailerUseCase.getMovieTrailer(type: type, id: id);
      yield SuccessMovieShowTrailerState(TrailerRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMovieShowTrailerState();
    }
  }

  Stream<MovieShowTrailerState> _fetchTvShowTrailer(
      String type, double id) async* {
    try {
      var response =
          await showTrailerUseCase.getShowTrailer(type: type, id: id);
      yield SuccessMovieShowTrailerState(TrailerRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMovieShowTrailerState();
    }
  }
}
