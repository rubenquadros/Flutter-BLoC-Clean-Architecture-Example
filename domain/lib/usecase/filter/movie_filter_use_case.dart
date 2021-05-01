import 'package:domain/repository/filter_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieFilterUseCase {
  final FilterRepository repository;

  MovieFilterUseCase(this.repository);

  Future<dynamic> getMovieGenres({required String type}) {
    return repository.getGenres(type);
  }
}
