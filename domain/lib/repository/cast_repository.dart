abstract class CastRepository {

  Future<dynamic> getMovieCast(String type, double id);
  Future<dynamic> getShowCast(String type, double id);

}