import 'package:domain/repository/video_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieTrailerUseCase {
  final VideoRepository repository;

  MovieTrailerUseCase(this.repository);

  Future<dynamic> getMovieTrailer({required String type, required double id}) {
    return repository.getMovieTrailer(type, id);
  }
}
