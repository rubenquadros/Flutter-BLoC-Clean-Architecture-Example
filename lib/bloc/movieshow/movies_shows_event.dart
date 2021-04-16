class MoviesShowsEvent {
  final String type;
  final String event;
  final int page;

  MoviesShowsEvent(
      {required this.type, required this.event, required this.page});
}
