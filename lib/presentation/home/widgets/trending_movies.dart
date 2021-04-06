import 'package:domain/model/trending_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/all/trending_bloc.dart';
import 'package:fun_box/bloc/all/trending_event.dart';
import 'package:fun_box/bloc/all/trending_state.dart';
import 'package:fun_box/presentation/common/common_display_tiles.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/ui_constants.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

class TrendingMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  final TrendingBloc _trendingBloc = GetIt.instance.get<TrendingBloc>();

  @override
  void dispose() {
    _trendingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _trendingBloc);
    _trendingBloc.add(TrendingEvent.movie);
    return BlocBuilder<TrendingBloc, TrendingState>(
      bloc: _trendingBloc,
      builder: (context, state) {
        if (state is InitialTrendingMoviesShowsState) {
          return _initState();
        } else if (state is SuccessTrendingMoviesState) {
          return _trendingMovies(context, state.record);
        } else if (state is ErrorMoviesShowsState) {
          return _error();
        } else {
          return _error();
        }
      },
    );
  }

  Widget _trendingMovies(BuildContext context, TrendingRecord trendingMovies) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                UIConstants.trending_movies,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: UIConstants.font_family_ironclad,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.arrow_right_alt_rounded,
                size: 40.0,
              )
            ],
          ),
        ),
        CommonDisplayTiles(
          width: width,
          itemCount: trendingMovies.results?.length ?? 0,
          results: trendingMovies.results,
          type: AppConstants.movie,
        )
      ],
    );
  }

  Widget _initState() {
    return CommonProgressBar();
  }

  Widget _error() {
    return ErrorUI();
  }
}
