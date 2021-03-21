import 'package:domain/repository/repository.dart';
import 'package:remote/datasource/movies_shows_data_source_impl.dart';
import 'package:remote/model/request/movies_shows_request.dart';

class RepositoryImpl implements Repository {

  var moviesShowsDataSource = MoviesShowsDataSourceImpl();

  @override
  Future<dynamic> getTrendingMoviesShows(String type) {
    return moviesShowsDataSource.getTrendingMoviesShows(MoviesShowsRequest(type: type));
  }

}