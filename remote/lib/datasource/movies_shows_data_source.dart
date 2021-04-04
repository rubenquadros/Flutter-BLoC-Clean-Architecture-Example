import 'package:remote/model/trending_request.dart';

abstract class MoviesShowsDataSource {

  Future<dynamic> getConfig();
  Future<dynamic> getTrending(TrendingRequest request);

}