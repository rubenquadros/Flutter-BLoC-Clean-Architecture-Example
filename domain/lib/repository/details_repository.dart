abstract class DetailsRepository {

  Future<dynamic> getMovieDetails(String type, double id);
  Future<dynamic> getShowDetails(String type, double id);
}