import 'package:domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingPeopleUseCase {
  final Repository repository;

  TrendingPeopleUseCase(this.repository);

  Future<dynamic> getTrendingPeople({required String type}) {
    return repository.getTrendingPeople(type);
  }
}