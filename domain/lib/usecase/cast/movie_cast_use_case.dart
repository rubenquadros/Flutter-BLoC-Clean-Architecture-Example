import 'package:domain/repository/cast_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieCastUseCase {
  final CastRepository repository;

  MovieCastUseCase(this.repository);

  Future<dynamic> getMovieCast({required String type, required double id}) {
    return repository.getMovieCast(type, id);
  }
}
