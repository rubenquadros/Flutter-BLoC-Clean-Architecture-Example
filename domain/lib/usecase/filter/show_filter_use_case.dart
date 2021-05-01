import 'package:domain/repository/filter_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowFilterUseCase {
  final FilterRepository repository;

  ShowFilterUseCase(this.repository);

  Future<dynamic> getShowGenres({required String type}) {
    return repository.getGenres(type);
  }
}
