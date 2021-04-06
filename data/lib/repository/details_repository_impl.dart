import 'package:domain/repository/details_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/details_request.dart';

@Singleton(as: DetailsRepository)
class DetailsRepositoryImpl extends DetailsRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  DetailsRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getMovieDetails(String type, double id) {
    return moviesShowsDataSource.getDetails(DetailsRequest(type: type, id: id));
  }

  @override
  Future getShowDetails(String type, double id) {
    return moviesShowsDataSource.getDetails(DetailsRequest(type: type, id: id));
  }

}