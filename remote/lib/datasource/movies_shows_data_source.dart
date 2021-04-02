import 'package:remote/model/request/movies_shows_request.dart';

abstract class MoviesShowsDataSource {

  Future<dynamic> getTrendingMoviesShows(MoviesShowsRequest request);
  Future<dynamic> getConfig();

}