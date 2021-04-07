import 'package:remote/model/cast_request.dart';
import 'package:remote/model/details_request.dart';
import 'package:remote/model/trailer_request.dart';
import 'package:remote/model/trending_request.dart';

abstract class MoviesShowsDataSource {

  Future<dynamic> getConfig();
  Future<dynamic> getTrending(TrendingRequest request);
  Future<dynamic> getDetails(DetailsRequest request);
  Future<dynamic> getTrailer(TrailerRequest request);
  Future<dynamic> getCast(CastRequest request);

}