import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_bloc.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_event.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_state.dart';
import 'package:fun_box/presentation/common/common_display_tiles.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

import '../../ui_constants.dart';

class CurrentlyPlaying extends StatefulWidget {
  final String type;

  CurrentlyPlaying({required this.type});

  @override
  State<StatefulWidget> createState() => _CurrentlyPlayingState(type);
}

class _CurrentlyPlayingState extends State<CurrentlyPlaying> {
  final String type;
  final MoviesShowsBloc _moviesShowsBloc =
      GetIt.instance.get<MoviesShowsBloc>();

  _CurrentlyPlayingState(this.type);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _moviesShowsBloc);
    _moviesShowsBloc.add(
        MoviesShowsEvent(type: type, event: AppConstants.currentlyPlaying, page: 1));
    return BlocBuilder(
        bloc: _moviesShowsBloc,
        builder: (context, state) {
          if (state is InitialMoviesShowsState) {
            return _initState();
          } else if (state is SuccessMoviesShowsState) {
            return _showCurrentPlaying(context, state.record);
          } else if (state is ErrorMoviesShowsState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _showCurrentPlaying(
      BuildContext context, MoviesShowsRecord currentPlaying) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              UIConstants.currentlyPlaying,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: UIConstants.fontFamilyIronclad,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: CommonDisplayTiles(
              width: width,
              itemCount: currentPlaying.results?.length ?? 0,
              results: currentPlaying.results,
              type: type),
        )
      ],
    );
  }

  Widget _initState() {
    return CommonProgressBar();
  }

  Widget _errorState() {
    return ErrorUI();
  }
}
