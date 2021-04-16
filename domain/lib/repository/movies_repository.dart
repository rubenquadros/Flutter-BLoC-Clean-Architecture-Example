abstract class MoviesRepository {

  Future<dynamic> getCurrentPlayingMovies();
  Future<dynamic> getPopularMovies(String type, int page);

}