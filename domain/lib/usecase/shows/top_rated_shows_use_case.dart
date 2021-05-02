import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TopRatedShowsUseCase {
  final ShowsRepository repository;

  TopRatedShowsUseCase(this.repository);

  Future<dynamic> getTopRatedShows({required String type, required int page}) {
    return repository.getTopRatedShows(type, page);
  }
}
