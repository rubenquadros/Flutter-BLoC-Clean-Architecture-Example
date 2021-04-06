import 'package:domain/repository/trending_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingMoviesUseCase {
  final TrendingRepository repository;

  TrendingMoviesUseCase(this.repository);

  Future<dynamic> getTrendingMovies({required String type}) async {
    return repository.getTrendingMovies(type);
  }
}
