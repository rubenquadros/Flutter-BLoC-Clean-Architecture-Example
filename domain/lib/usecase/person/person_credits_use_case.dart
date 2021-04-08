import 'package:domain/repository/person_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PersonCreditsUseCase {
  final PersonRepository repository;

  PersonCreditsUseCase(this.repository);

  Future<dynamic> getPersonCredits({required double id}) {
    return repository.getPersonCredits(id);
  }
}
