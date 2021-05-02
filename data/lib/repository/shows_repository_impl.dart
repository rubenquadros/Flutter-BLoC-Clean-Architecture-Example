import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/movies_shows_genre_request.dart';
import 'package:remote/model/movies_shows_request.dart';
import 'package:remote/model/page_request.dart';

@Singleton(as: ShowsRepository)
class ShowsRepositoryImpl extends ShowsRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  ShowsRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getCurrentPlayingShows(int page) {
    return moviesShowsDataSource
        .getCurrentPlayingShows(PageRequest(page: page));
  }

  @override
  Future getPopularShows(String type, int page) {
    return moviesShowsDataSource
        .getPopularMoviesShows(MoviesShowsRequest(type: type, page: page));
  }

  @override
  Future getLatestShows(String type, int page) {
    return moviesShowsDataSource
        .getLatestMoviesShows(MoviesShowsRequest(type: type, page: page));
  }

  @override
  Future getTopRatedShows(String type, int page) {
    return moviesShowsDataSource
        .getTopRatedMoviesShows(MoviesShowsRequest(type: type, page: page));
  }

  @override
  Future getAiringTodayShows(int page) {
    return moviesShowsDataSource.getAiringTodayShows(PageRequest(page: page));
  }

  @override
  Future getShowsByGenre(String type, int genreId, int page) {
    return moviesShowsDataSource.getMoviesShowsByGenre(
        MoviesShowsGenreRequest(type: type, genreId: genreId, page: page));
  }
}
