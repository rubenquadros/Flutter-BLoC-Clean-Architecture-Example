import 'package:domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingMoviesShowsUseCase {

  final Repository repository;

  TrendingMoviesShowsUseCase(this.repository);

  Future<dynamic> getTrendingMoviesShows({required String type})  async {
    return repository.getTrendingMoviesShows(type);
  }

}