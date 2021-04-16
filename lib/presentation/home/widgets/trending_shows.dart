import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/all/trending_bloc.dart';
import 'package:fun_box/bloc/all/trending_event.dart';
import 'package:fun_box/bloc/all/trending_state.dart';
import 'package:fun_box/presentation/common/common_display_tiles.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/movieshow/movies_shows.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

import '../../ui_constants.dart';

class TrendingShows extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrendingShowsState();
}

class _TrendingShowsState extends State<TrendingShows> {
  final TrendingBloc _trendingBloc = GetIt.instance.get<TrendingBloc>();

  @override
  void dispose() {
    _trendingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _trendingBloc);
    _trendingBloc.add(TrendingEvent.tv);
    return BlocBuilder<TrendingBloc, TrendingState>(
      bloc: _trendingBloc,
      builder: (context, state) {
        if (state is InitialTrendingMoviesShowsState) {
          return _initState();
        } else if (state is SuccessTrendingShowsState) {
          return _trendingShows(context, state.record);
        } else if (state is ErrorMoviesShowsState) {
          return _error();
        } else {
          return _error();
        }
      },
    );
  }

  Widget _trendingShows(BuildContext context, MoviesShowsRecord trendingShows) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                UIConstants.trendingShows,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: UIConstants.fontFamilyIronclad,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () => _navigateToShows(context),
                child: Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 40.0,
                ),
              )
            ],
          ),
        ),
        CommonDisplayTiles(
          width: width,
          itemCount: trendingShows.results?.length ?? 0,
          results: trendingShows.results,
          type: AppConstants.tvShow,
        )
      ],
    );
  }

  Widget _initState() {
    return CommonEmptyInit();
  }

  Widget _error() {
    return ErrorUI();
  }

  void _navigateToShows(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MoviesShows(type:  AppConstants.tvShow);
    }));
  }
}
