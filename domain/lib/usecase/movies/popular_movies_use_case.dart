import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PopularMoviesUseCase {
  final MoviesRepository repository;

  PopularMoviesUseCase(this.repository);

  Future<dynamic> getPopularMovies({required String type, required int page}) {
    return repository.getPopularMovies(type, page);
  }
}
