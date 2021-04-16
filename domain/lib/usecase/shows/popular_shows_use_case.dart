import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PopularShowsUseCase {
  final ShowsRepository repository;

  PopularShowsUseCase(this.repository);

  Future<dynamic> getPopularShows({required String type, required int page}) {
    return repository.getPopularShows(type, page);
  }
}
