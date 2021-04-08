import 'package:domain/repository/config_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';

@Singleton(as: ConfigRepository)
class ConfigRepositoryImpl extends ConfigRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  ConfigRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future<dynamic> getConfig() {
    return moviesShowsDataSource.getConfig();
  }
}
