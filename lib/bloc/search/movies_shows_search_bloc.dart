import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/search/movies_shows_search_event.dart';
import 'package:fun_box/bloc/search/movies_shows_search_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/usecase/search_movies_shows_use_case.dart';

@injectable
class MoviesShowsSearchBloc
    extends Bloc<MoviesShowsSearchEvent, MoviesShowsSearchState> {
  final SearchMoviesShowsUseCase searchMoviesShowsUseCase;

  MoviesShowsSearchBloc(this.searchMoviesShowsUseCase)
      : super(InitialMoviesShowsSearchState());

  @override
  Stream<MoviesShowsSearchState> mapEventToState(
      MoviesShowsSearchEvent event) async* {
    switch (event.event) {
      case AppConstants.suggestions:
        yield* _fetchSuggestions(event.searchTerm);
        break;
      case AppConstants.progress:
        yield* _showProgress();
        break;
      default:
        break;
    }
  }

  Stream<MoviesShowsSearchState> _showProgress() async* {
    yield ProgressMoviesShowsSearchState();
  }

  Stream<MoviesShowsSearchState> _fetchSuggestions(String searchTerm) async* {
    try {
      var response = await searchMoviesShowsUseCase.searchMoviesShows(
          searchTerm: searchTerm);
      yield SuccessSuggestionsMoviesShowsState(
          MoviesShowsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorMoviesShowsSearchState();
    }
  }
}
