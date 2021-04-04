import 'package:domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingShowsUseCase {

  final Repository repository;

  TrendingShowsUseCase(this.repository);

  Future<dynamic> getTrendingShows({required String type}) {
    return repository.getTrendingShows(type);
  }

}