import 'package:domain/repository/cast_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowCastUseCase {
  final CastRepository repository;

  ShowCastUseCase(this.repository);

  Future<dynamic> getShowCast({required String type, required double id}) {
    return repository.getShowCast(type, id);
  }
}
