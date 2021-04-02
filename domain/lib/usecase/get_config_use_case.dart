import 'package:domain/repository/config_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetConfigUseCase {

  final ConfigRepository repository;

  GetConfigUseCase(this.repository);

  Future<dynamic> getConfig() async {
    return repository.getConfig();
  }
}