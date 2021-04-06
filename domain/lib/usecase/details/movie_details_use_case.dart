import 'package:domain/repository/details_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsUseCase {
  final DetailsRepository repository;

  MovieDetailsUseCase(this.repository);

  Future<dynamic> getMovieDetails({required String type, required double id}) {
    return repository.getMovieDetails(type, id);
  }
}
