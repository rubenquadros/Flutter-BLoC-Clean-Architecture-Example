import 'package:domain/repository/cast_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/cast_request.dart';

@Singleton(as: CastRepository)
class CastRepositoryImpl extends CastRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  CastRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getMovieCast(String type, double id) {
    return moviesShowsDataSource.getCast(CastRequest(type, id));
  }

  @override
  Future getShowCast(String type, double id) {
    return moviesShowsDataSource.getCast(CastRequest(type, id));
  }

}