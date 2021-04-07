abstract class VideoRepository {

  Future<dynamic> getMovieTrailer(String type, double id);
  Future<dynamic> getShowTrailer(String type, double id);
}