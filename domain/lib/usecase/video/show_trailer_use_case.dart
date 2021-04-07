import 'package:domain/repository/video_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowTrailerUseCase {
  final VideoRepository repository;

  ShowTrailerUseCase(this.repository);

  Future<dynamic> getShowTrailer({required String type, required double id}) {
    return repository.getShowTrailer(type, id);
  }
}
