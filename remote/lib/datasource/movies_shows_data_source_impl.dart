import 'package:injectable/injectable.dart';
import 'package:remote/http_client.dart';
import 'package:remote/model/trending_request.dart';
import 'package:remote/util/api_constants.dart';
import 'movies_shows_data_source.dart';

@Singleton(as: MoviesShowsDataSource)
class MoviesShowsDataSourceImpl implements MoviesShowsDataSource {
  var httpClient = HttpClient();
  final apiKey = '534c49b3a09e37303f16bf241432922d';

  @override
  Future<dynamic> getConfig() {
    return httpClient.get(
        url: '${ApiConstants.base_url}/configuration?api_key=$apiKey');
  }

  @override
  Future<dynamic> getTrending(TrendingRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/trending/${request.type}/day?api_key=$apiKey');
  }
  
}
