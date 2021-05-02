import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LatestShowsUseCase {
  final ShowsRepository repository;

  LatestShowsUseCase(this.repository);

  Future<dynamic> getLatestShows({required String type, required int page}) {
    return repository.getLatestShows(type, page);
  }
}
