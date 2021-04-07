import 'package:flutter/material.dart';
import 'package:fun_box/presentation/video/video_player.dart';

class MovieShowTrailer extends StatefulWidget {
  final String type;
  final double id;

  MovieShowTrailer({required this.type, required this.id});

  @override
  State<StatefulWidget> createState() => _MovieShowTrailerState(type, id);
}

class _MovieShowTrailerState extends State<MovieShowTrailer> {
  final String type;
  final double id;

  _MovieShowTrailerState(this.type, this.id);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: VideoPlayer(type: type, id: id),
      ),
    );
  }
}
