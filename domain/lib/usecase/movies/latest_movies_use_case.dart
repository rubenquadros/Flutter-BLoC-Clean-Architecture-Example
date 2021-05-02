import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LatestMoviesUseCase {
  final MoviesRepository repository;

  LatestMoviesUseCase(this.repository);

  Future<dynamic> getLatestMovies({required String type, required int page}) {
    return repository.getLatestMovies(type, page);
  }
}
