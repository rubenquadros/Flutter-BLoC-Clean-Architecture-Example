import 'package:domain/repository/video_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/datasource/movies_shows_data_source.dart';
import 'package:remote/model/trailer_request.dart';

@Singleton(as: VideoRepository)
class VideoRepositoryImpl extends VideoRepository {
  final MoviesShowsDataSource moviesShowsDataSource;

  VideoRepositoryImpl(this.moviesShowsDataSource);

  @override
  Future getMovieTrailer(String type, double id) {
    return moviesShowsDataSource.getTrailer(TrailerRequest(type, id));
  }

  @override
  Future getShowTrailer(String type, double id) {
    return moviesShowsDataSource.getTrailer(TrailerRequest(type, id));
  }
}
