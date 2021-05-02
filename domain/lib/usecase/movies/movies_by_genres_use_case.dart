import 'package:domain/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesByGenresUseCase {
  final MoviesRepository repository;

  MoviesByGenresUseCase(this.repository);

  Future<dynamic> getMoviesByGenre(
      {required String type, required int genreId, required int page}) {
    return repository.getMoviesByGenre(type, genreId, page);
  }
}
