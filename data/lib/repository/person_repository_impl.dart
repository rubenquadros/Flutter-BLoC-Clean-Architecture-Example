import 'package:domain/repository/person_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/person_credits_request.dart';
import 'package:remote/model/person_info_request.dart';

@Singleton(as: PersonRepository)
class PersonRepositoryImpl extends PersonRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  PersonRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getPersonCredits(double id) {
    return moviesShowsDataSource.getPersonCredits(PersonCreditsRequest(id: id));
  }

  @override
  Future getPersonInfo(double id) {
    return moviesShowsDataSource.getPersonInfo(PersonInfoRequest(id: id));
  }
}
