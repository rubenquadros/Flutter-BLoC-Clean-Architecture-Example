import 'package:domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/request/movies_shows_request.dart';

@Singleton(as: Repository)
class RepositoryImpl implements Repository {

  final MoviesShowsDataSource moviesShowsDataSource;

  RepositoryImpl(this.moviesShowsDataSource);

  @override
  Future<dynamic> getTrendingMoviesShows(String type) {
    return moviesShowsDataSource.getTrendingMoviesShows(MoviesShowsRequest(type: type));
  }

}