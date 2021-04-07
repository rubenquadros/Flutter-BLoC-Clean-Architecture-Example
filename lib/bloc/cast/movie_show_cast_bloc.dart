import 'package:domain/model/cast_record.dart';
import 'package:domain/usecase/cast/movie_cast_use_case.dart';
import 'package:domain/usecase/cast/show_cast_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/cast/movie_show_cast_event.dart';
import 'package:fun_box/bloc/cast/movie_show_cast_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieShowCastBloc extends Bloc<MovieShowCastEvent, MovieShowCastState> {
  final MovieCastUseCase movieCastUseCase;
  final ShowCastUseCase showCastUseCase;

  MovieShowCastBloc(this.movieCastUseCase, this.showCastUseCase)
      : super(InitialMovieShowCastState());

  @override
  Stream<MovieShowCastState> mapEventToState(MovieShowCastEvent event) async* {
    switch (event.type) {
      case AppConstants.movie:
        yield* _fetchMovieCast(event.type, event.id);
        break;
      case AppConstants.tvShow:
        yield* _fetchShowCast(event.type, event.id);
        break;
      default:
        break;
    }
  }

  Stream<MovieShowCastState> _fetchMovieCast(String type, double id) async* {
    try {
      var response = await movieCastUseCase.getMovieCast(type: type, id: id);
      yield SuccessMovieShowCastState(CastRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMovieShowCastState();
    }
  }

  Stream<MovieShowCastState> _fetchShowCast(String type, double id) async* {
    try {
      var response = await showCastUseCase.getShowCast(type: type, id: id);
      yield SuccessMovieShowCastState(CastRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMovieShowCastState();
    }
  }
}
