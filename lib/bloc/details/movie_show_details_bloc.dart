import 'package:domain/model/movie_details_record.dart';
import 'package:domain/model/show_details_record.dart';
import 'package:domain/usecase/details/movie_details_use_case.dart';
import 'package:domain/usecase/details/show_details_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/details/movie_show_details_event.dart';
import 'package:fun_box/bloc/details/movie_show_details_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieShowDetailsBloc
    extends Bloc<MovieShowDetailsEvent, MovieShowDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;
  final ShowDetailsUseCase showDetailsUseCase;

  MovieShowDetailsBloc(this.movieDetailsUseCase, this.showDetailsUseCase)
      : super(InitialMovieShowDetailsState());

  @override
  Stream<MovieShowDetailsState> mapEventToState(
      MovieShowDetailsEvent event) async* {
    switch (event.type) {
      case AppConstants.movie:
        yield* _fetchMovieDetail(event.type, event.id);
        break;
      case AppConstants.tvShow:
        yield* _fetchShowDetail(event.type, event.id);
        break;
      default:
        break;
    }
  }

  Stream<MovieShowDetailsState> _fetchMovieDetail(
      String type, double id) async* {
    try {
      var response = await movieDetailsUseCase.getMovieDetails(type: type, id: id);
      yield SuccessMovieDetailsState(MovieDetailsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMovieShowDetailsState();
    }
  }

  Stream<MovieShowDetailsState> _fetchShowDetail(
      String type, double id) async* {
    try {
      var response = await showDetailsUseCase.getShowDetails(type: type, id: id);
      yield SuccessShowDetailsState(ShowDetailsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMovieShowDetailsState();
    }
  }
}
