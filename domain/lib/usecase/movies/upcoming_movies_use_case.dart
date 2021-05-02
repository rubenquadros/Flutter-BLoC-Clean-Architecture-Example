import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpcomingMoviesUseCase {
  final MoviesRepository repository;

  UpcomingMoviesUseCase(this.repository);

  Future<dynamic> getUpcomingMovies({required int page}) {
    return repository.getUpcomingMovies(page);
  }
}
