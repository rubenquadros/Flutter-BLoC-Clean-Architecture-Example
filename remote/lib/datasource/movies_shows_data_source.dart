import 'package:remote/model/cast_request.dart';
import 'package:remote/model/details_request.dart';
import 'package:remote/model/genres_request.dart';
import 'package:remote/model/movies_shows_genre_request.dart';
import 'package:remote/model/page_request.dart';
import 'package:remote/model/person_credits_request.dart';
import 'package:remote/model/person_info_request.dart';
import 'package:remote/model/movies_shows_request.dart';
import 'package:remote/model/search_request.dart';
import 'package:remote/model/trailer_request.dart';
import 'package:remote/model/trending_request.dart';

abstract class MoviesShowsDataSource {

  Future<dynamic> getConfig();
  Future<dynamic> getTrending(TrendingRequest request);
  Future<dynamic> getTrendingPeople(TrendingRequest request);
  Future<dynamic> getDetails(DetailsRequest request);
  Future<dynamic> getTrailer(TrailerRequest request);
  Future<dynamic> getCast(CastRequest request);
  Future<dynamic> getPersonInfo(PersonInfoRequest request);
  Future<dynamic> getPersonCredits(PersonCreditsRequest request);
  Future<dynamic> getCurrentPlayingMovies(PageRequest request);
  Future<dynamic> getCurrentPlayingShows(PageRequest request);
  Future<dynamic> getPopularMoviesShows(MoviesShowsRequest request);
  Future<dynamic> getLatestMoviesShows(MoviesShowsRequest request);
  Future<dynamic> getTopRatedMoviesShows(MoviesShowsRequest request);
  Future<dynamic> getUpcomingMovies(PageRequest request);
  Future<dynamic> getAiringTodayShows(PageRequest request);
  Future<dynamic> getMoviesShowsByGenre(MoviesShowsGenreRequest request);
  Future<dynamic> getGenres(GenresRequest request);
  Future<dynamic> searchMoviesShows(SearchRequest request);
}