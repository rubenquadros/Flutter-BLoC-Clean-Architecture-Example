abstract class Repository {

  Future<dynamic> getTrendingMovies(String type);
  Future<dynamic> getTrendingShows(String type);
  Future<dynamic> getTrendingPeople(String type);

}