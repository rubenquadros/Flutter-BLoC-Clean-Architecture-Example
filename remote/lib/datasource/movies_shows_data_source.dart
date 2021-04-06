import 'package:remote/model/details_request.dart';
import 'package:remote/model/trending_request.dart';

abstract class MoviesShowsDataSource {

  Future<dynamic> getConfig();
  Future<dynamic> getTrending(TrendingRequest request);
  Future<dynamic> getDetails(DetailsRequest request);

}