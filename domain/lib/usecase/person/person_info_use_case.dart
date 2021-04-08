import 'package:domain/repository/person_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PersonInfoUseCase {
  final PersonRepository repository;

  PersonInfoUseCase(this.repository);

  Future<dynamic> getPersonIfo({required double id}) {
    return repository.getPersonInfo(id);
  }
}
