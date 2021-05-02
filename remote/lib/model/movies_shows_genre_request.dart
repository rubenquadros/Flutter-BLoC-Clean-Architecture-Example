class MoviesShowsGenreRequest {
  String type;
  int genreId;
  int page;

  MoviesShowsGenreRequest(
      {required this.type, required this.genreId, required this.page});
}
