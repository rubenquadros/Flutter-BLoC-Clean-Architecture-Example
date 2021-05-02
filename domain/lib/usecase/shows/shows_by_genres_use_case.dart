import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowsByGenresUseCase {
  final ShowsRepository repository;

  ShowsByGenresUseCase(this.repository);

  Future<dynamic> getShowsByGenres(
      {required String type, required int genreId, required int page}) {
    return repository.getShowsByGenre(type, genreId, page);
  }
}
