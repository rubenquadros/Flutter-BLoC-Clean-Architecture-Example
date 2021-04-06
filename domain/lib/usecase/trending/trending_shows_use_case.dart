import 'package:domain/repository/trending_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingShowsUseCase {

  final TrendingRepository repository;

  TrendingShowsUseCase(this.repository);

  Future<dynamic> getTrendingShows({required String type}) {
    return repository.getTrendingShows(type);
  }

}