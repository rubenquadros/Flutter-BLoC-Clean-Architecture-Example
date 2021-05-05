import 'package:domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/search_request.dart';

@Singleton(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  SearchRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future searchMoviesShows(String searchTerm) {
    return moviesShowsDataSource
        .searchMoviesShows(SearchRequest(searchTerm: searchTerm));
  }
}
