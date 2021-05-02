import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/movies_shows_genre_request.dart';
import 'package:remote/model/movies_shows_request.dart';
import 'package:remote/model/page_request.dart';

@Singleton(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  MoviesRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getCurrentPlayingMovies(int page) {
    return moviesShowsDataSource
        .getCurrentPlayingMovies(PageRequest(page: page));
  }

  @override
  Future getPopularMovies(String type, int page) {
    return moviesShowsDataSource
        .getPopularMoviesShows(MoviesShowsRequest(type: type, page: page));
  }

  @override
  Future getLatestMovies(String type, int page) {
    return moviesShowsDataSource
        .getLatestMoviesShows(MoviesShowsRequest(type: type, page: page));
  }

  @override
  Future getTopRatedMovies(String type, int page) {
    return moviesShowsDataSource
        .getTopRatedMoviesShows(MoviesShowsRequest(type: type, page: page));
  }

  @override
  Future getUpcomingMovies(int page) {
    return moviesShowsDataSource.getUpcomingMovies(PageRequest(page: page));
  }

  @override
  Future getMoviesByGenre(String type, int genreId, int page) {
    return moviesShowsDataSource.getMoviesShowsByGenre(
        MoviesShowsGenreRequest(type: type, genreId: genreId, page: page));
  }
}
