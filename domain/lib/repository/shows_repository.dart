abstract class ShowsRepository {

  Future<dynamic> getCurrentPlayingShows();
  Future<dynamic> getPopularShows(String type, int page);

}