import 'package:injectable/injectable.dart';
import 'package:remote/http_client.dart';
import 'package:remote/model/cast_request.dart';
import 'package:remote/model/details_request.dart';
import 'package:remote/model/genres_request.dart';
import 'package:remote/model/movies_shows_genre_request.dart';
import 'package:remote/model/page_request.dart';
import 'package:remote/model/person_credits_request.dart';
import 'package:remote/model/person_info_request.dart';
import 'package:remote/model/movies_shows_request.dart';
import 'package:remote/model/trailer_request.dart';
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

  @override
  Future getTrendingPeople(TrendingRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/trending/${request.type}/week?api_key=$apiKey');
  }

  @override
  Future<dynamic> getDetails(DetailsRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/${request.type}/${request.id}?api_key=$apiKey');
  }

  @override
  Future<dynamic> getTrailer(TrailerRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/${request.type}/${request.id}/videos?api_key=$apiKey');
  }

  @override
  Future<dynamic> getCast(CastRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/${request.type}/${request.id}/credits?api_key=$apiKey');
  }

  @override
  Future<dynamic> getPersonCredits(PersonCreditsRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/person/${request.id}/combined_credits?api_key=$apiKey');
  }

  @override
  Future<dynamic> getPersonInfo(PersonInfoRequest request) {
    return httpClient.get(
        url: '${ApiConstants.base_url}/person/${request.id}?api_key=$apiKey');
  }

  @override
  Future<dynamic> getCurrentPlayingMovies(PageRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/movie/now_playing?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getCurrentPlayingShows(PageRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/tv/on_the_air?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getPopularMoviesShows(MoviesShowsRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/${request.type}/popular?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getLatestMoviesShows(MoviesShowsRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/${request.type}/latest?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getTopRatedMoviesShows(MoviesShowsRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/${request.type}/top_rated?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getUpcomingMovies(PageRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/movie/upcoming?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getAiringTodayShows(PageRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/tv/airing_today?api_key=$apiKey&page=${request.page}');
  }

  @override
  Future<dynamic> getMoviesShowsByGenre(MoviesShowsGenreRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/discover/${request.type}?api_key=$apiKey&with_genres=${request.genreId}&page=${request.page}');
  }

  @override
  Future<dynamic> getGenres(GenresRequest request) {
    return httpClient.get(
        url:
            '${ApiConstants.base_url}/genre/${request.type}/list?api_key=$apiKey');
  }
}
