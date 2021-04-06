import 'package:domain/repository/trending_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingPeopleUseCase {
  final TrendingRepository repository;

  TrendingPeopleUseCase(this.repository);

  Future<dynamic> getTrendingPeople({required String type}) {
    return repository.getTrendingPeople(type);
  }
}