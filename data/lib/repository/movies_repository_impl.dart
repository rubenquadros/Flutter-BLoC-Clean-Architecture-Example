import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/popular_movies_shows_request.dart';

@Singleton(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  MoviesRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getCurrentPlayingMovies() {
    return moviesShowsDataSource.getCurrentPlayingMovies();
  }

  @override
  Future getPopularMovies(String type, int page) {
    return moviesShowsDataSource.getPopularMoviesShows(
        PopularMoviesShowsRequest(type: type, page: page));
  }
}
