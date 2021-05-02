import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrentPlayingShowsUseCase {
  final ShowsRepository repository;

  CurrentPlayingShowsUseCase(this.repository);

  Future<dynamic> getCurrentPlayingShows({required int page}) {
    return repository.getCurrentPlayingShows(page);
  }
}
