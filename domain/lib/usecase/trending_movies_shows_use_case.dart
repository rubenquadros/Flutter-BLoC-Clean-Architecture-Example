import 'package:domain/repository/repository.dart';

class TrendingMoviesShowsUseCase {

  final Repository repository;

  TrendingMoviesShowsUseCase({this.repository});

  Future<dynamic> getTrendingMoviesShows({String type})  async {
    return repository.getTrendingMoviesShows(type);
  }

}