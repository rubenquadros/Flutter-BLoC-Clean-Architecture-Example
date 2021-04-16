import 'package:domain/repository/trending_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/trending_request.dart';

@Singleton(as: TrendingRepository)
class TrendingRepositoryImpl implements TrendingRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  TrendingRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getTrendingMovies(String type) {
    return moviesShowsDataSource
        .getTrending(TrendingRequest(type: type));
  }

  @override
  Future getTrendingShows(String type) {
    return moviesShowsDataSource
        .getTrending(TrendingRequest(type: type));
  }

  @override
  Future getTrendingPeople(String type) {
    return moviesShowsDataSource
        .getTrendingPeople(TrendingRequest(type: type));
  }
}
