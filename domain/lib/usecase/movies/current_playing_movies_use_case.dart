import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrentPlayingMoviesUseCase {
  final MoviesRepository repository;

  CurrentPlayingMoviesUseCase(this.repository);

  Future<dynamic> getCurrentPlayingMovies() {
    return repository.getCurrentPlayingMovies();
  }
}
