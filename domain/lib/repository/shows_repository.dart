abstract class ShowsRepository {

  Future<dynamic> getCurrentPlayingShows(int page);
  Future<dynamic> getPopularShows(String type, int page);
  Future<dynamic> getLatestShows(String type, int page);
  Future<dynamic> getTopRatedShows(String type, int page);
  Future<dynamic> getAiringTodayShows(int page);
  Future<dynamic> getShowsByGenre(String type, int genreId, int page);

}