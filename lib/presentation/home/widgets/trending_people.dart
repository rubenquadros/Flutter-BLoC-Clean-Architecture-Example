import 'package:domain/model/trending_people_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/all/trending_bloc.dart';
import 'package:fun_box/bloc/all/trending_event.dart';
import 'package:fun_box/bloc/all/trending_state.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_people_tiles.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:get_it/get_it.dart';

import '../../ui_constants.dart';

class TrendingPeople extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrendingPeopleState();
}

class _TrendingPeopleState extends State {
  final TrendingBloc _trendingBloc = GetIt.instance.get<TrendingBloc>();

  @override
  void dispose() {
    _trendingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _trendingBloc);
    _trendingBloc.add(TrendingEvent.person);
    return BlocBuilder<TrendingBloc, TrendingState>(
      bloc: _trendingBloc,
      builder: (context, state) {
        if (state is InitialTrendingMoviesShowsState) {
          return _initState();
        } else if (state is SuccessTrendingPersonState) {
          return _trendingPeople(context, state.record);
        } else {
          return _error();
        }
      },
    );
  }

  Widget _trendingPeople(
      BuildContext context, TrendingPeopleRecord trendingPeople) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              UIConstants.trendingPeople,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: UIConstants.fontFamilyIronclad,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        CommonPeopleTiles(
            radius: 20.0,
            width: width,
            itemCount: trendingPeople.results?.length ?? 0,
            results: trendingPeople.results)
      ],
    );
  }

  Widget _initState() {
    return CommonEmptyInit();
  }

  Widget _error() {
    return ErrorUI();
  }
}
