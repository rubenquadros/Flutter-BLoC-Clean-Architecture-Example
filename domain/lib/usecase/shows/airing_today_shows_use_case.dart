import 'package:domain/repository/shows_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AiringTodayShowsUseCase {
  final ShowsRepository repository;

  AiringTodayShowsUseCase(this.repository);

  Future<dynamic> getAiringTodayShows({required int page}) {
    return repository.getAiringTodayShows(page);
  }
}
