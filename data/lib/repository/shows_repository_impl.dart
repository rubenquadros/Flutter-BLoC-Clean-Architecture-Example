import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/popular_movies_shows_request.dart';

@Singleton(as: ShowsRepository)
class ShowsRepositoryImpl extends ShowsRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  ShowsRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getCurrentPlayingShows() {
    return moviesShowsDataSource.getCurrentPlayingShows();
  }

  @override
  Future getPopularShows(String type, int page) {
    return moviesShowsDataSource.getPopularMoviesShows(
        PopularMoviesShowsRequest(type: type, page: page));
  }
}
