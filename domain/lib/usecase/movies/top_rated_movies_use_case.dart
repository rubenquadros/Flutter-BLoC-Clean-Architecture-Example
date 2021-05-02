import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TopRatedMoviesUseCase {
  final MoviesRepository repository;

  TopRatedMoviesUseCase(this.repository);

  Future<dynamic> getTopRatedMovies({required String type, required int page}) {
    return repository.getTopRatedMovies(type, page);
  }
}
