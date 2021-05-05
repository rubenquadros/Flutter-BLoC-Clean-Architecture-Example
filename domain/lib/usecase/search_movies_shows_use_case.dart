import 'package:domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMoviesShowsUseCase {
  final SearchRepository repository;

  SearchMoviesShowsUseCase(this.repository);

  Future<dynamic> searchMoviesShows({required String searchTerm}) {
    return repository.searchMoviesShows(searchTerm);
  }
}
