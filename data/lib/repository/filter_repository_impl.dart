import 'package:domain/repository/filter_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/genres_request.dart';

@Singleton(as: FilterRepository)
class FilterRepositoryImpl extends FilterRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  FilterRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getGenres(String type) {
    return moviesShowsDataSource.getGenres(GenresRequest(type: type));
  }

}