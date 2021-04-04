import 'package:domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingMoviesUseCase {
  final Repository repository;

  TrendingMoviesUseCase(this.repository);

  Future<dynamic> getTrendingMovies({required String type}) async {
    return repository.getTrendingMovies(type);
  }
}
