import 'package:remote/http_client.dart';
import 'package:remote/model/request/movies_shows_request.dart';
import 'package:remote/util/api_constants.dart';
import 'movies_shows_data_source.dart';

class MoviesShowsDataSourceImpl implements MoviesShowsDataSource {
  var httpClient = HttpClient();
  final apiKey = '534c49b3a09e37303f16bf241432922d';

  @override
  Future<dynamic> getTrendingMoviesShows(
      MoviesShowsRequest request) {
    return httpClient.get(url: '${ApiConstants.base_url}/trending/${request.type}/day?api_key=$apiKey');
  }
}
