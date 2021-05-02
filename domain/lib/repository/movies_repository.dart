abstract class MoviesRepository {

  Future<dynamic> getCurrentPlayingMovies(int page);
  Future<dynamic> getPopularMovies(String type, int page);
  Future<dynamic> getLatestMovies(String type, int page);
  Future<dynamic> getTopRatedMovies(String type, int page);
  Future<dynamic> getUpcomingMovies(int page);
  Future<dynamic> getMoviesByGenre(String type, int genreId, int page);

}