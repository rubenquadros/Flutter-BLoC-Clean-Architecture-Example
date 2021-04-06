import 'package:domain/repository/details_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowDetailsUseCase {

  final DetailsRepository repository;

  ShowDetailsUseCase(this.repository);

  Future<dynamic> getShowDetails({required String type, required double id}) {
    return repository.getShowDetails(type, id);
  }

}