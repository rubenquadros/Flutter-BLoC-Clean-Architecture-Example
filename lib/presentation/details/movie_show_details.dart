import 'package:flutter/material.dart';
import 'package:fun_box/presentation/details/widgets/movie_show_cast.dart';
import 'package:fun_box/presentation/details/widgets/movie_show_info.dart';

class MovieShowDetails extends StatefulWidget {
  final String type;
  final double id;

  MovieShowDetails({required this.type, required this.id});

  @override
  State<StatefulWidget> createState() => _MovieShowDetailsState(type, id);
}

class _MovieShowDetailsState extends State<MovieShowDetails> {
  final String type;
  final double id;

  _MovieShowDetailsState(this.type, this.id);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
            shrinkWrap: true,
          children: [
            MovieShowInfo(type: type, id: id),
            Padding(
              padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              child: MovieShowCast(type: type, id: id),
            )
          ],
        ),
      ),
    );
  }
}
