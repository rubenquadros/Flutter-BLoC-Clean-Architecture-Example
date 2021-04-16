import 'package:domain/model/trailer_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/video/movie_show_trailer_bloc.dart';
import 'package:fun_box/bloc/video/movie_show_trailer_event.dart';
import 'package:fun_box/bloc/video/movie_show_trailer_state.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String type;
  final double id;

  VideoPlayer({required this.type, required this.id});

  @override
  State<StatefulWidget> createState() => _VideoPlayerState(type, id);
}

class _VideoPlayerState extends State<VideoPlayer> {
  final String type;
  final double id;
  final MovieShowTrailerBloc _movieShowTrailerBloc =
      GetIt.instance.get<MovieShowTrailerBloc>();

  _VideoPlayerState(this.type, this.id);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _movieShowTrailerBloc);
    _movieShowTrailerBloc.add(MovieShowTrailerEvent(type: type, id: id));
    return BlocBuilder(
        bloc: _movieShowTrailerBloc,
        builder: (context, state) {
          if (state is InitialMovieShowTrailerState) {
            return _initState();
          } else if (state is SuccessMovieShowTrailerState) {
            return _playTrailer(state.record);
          } else if (state is ErrorMovieShowTrailerState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _playTrailer(TrailerRecord trailers) {
    var trailer = '';
    if (trailers.results != null && trailers.results!.length > 0) {
      for (var i = 0; i < trailers.results!.length; i++) {
        if (trailers.results![i].name == AppConstants.trailer) {
          trailer = trailers.results![i].key ?? '';
        }
      }
      if (trailer.isEmpty) {
        trailer = trailers.results![0].key ?? '';
      }
    }

    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: trailer,
        flags: YoutubePlayerFlags(autoPlay: true, loop: true));
    return Container(
      child: YoutubePlayer(
        controller: _controller,
      ),
    );
  }

  Widget _initState() {
    return CommonProgressBar();
  }

  Widget _errorState() {
    return ErrorUI();
  }
}
