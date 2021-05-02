import 'package:domain/model/movie_show_genres_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/filter/movies_shows_filter_bloc.dart';
import 'package:fun_box/bloc/filter/movies_shows_filter_event.dart';
import 'package:fun_box/bloc/filter/movies_shows_filter_state.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

import '../ui_constants.dart';

class MoviesShowsFilters extends StatefulWidget {
  final String type;
  final String selectedValue;

  MoviesShowsFilters({required this.type, required this.selectedValue});

  @override
  State<StatefulWidget> createState() => _MoviesShowsFiltersState(type, selectedValue);
}

class _MoviesShowsFiltersState extends State<MoviesShowsFilters> {
  final String type;
  final String selectedValue;
  final MoviesShowsFilterBloc _moviesShowsFilterBloc =
      GetIt.instance.get<MoviesShowsFilterBloc>();
  List<Genres>? _movieShowGenres;

  _MoviesShowsFiltersState(this.type, this.selectedValue);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _moviesShowsFilterBloc);
    _moviesShowsFilterBloc.add(MoviesShowsFilterEvent(type: type));
    return BlocBuilder(
        bloc: _moviesShowsFilterBloc,
        builder: (context, state) {
          if (state is InitialMoviesShowsFilterState) {
            return _initState();
          } else if (state is SuccessMoviesShowsFilterState) {
            _movieShowGenres = state.record.genres;
            return _showFilters();
          } else if (state is ErrorMoviesShowsFilterState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _showFilters() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.filter_list_rounded,
                  size: 30.0,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  UIConstants.sortBy,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: UIConstants.fontFamilyMetropolis,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ))
          ],
        ),
        Wrap(
          children: _sortByWidgets.toList(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.filter_list_rounded,
                  size: 30.0,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  UIConstants.genres,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: UIConstants.fontFamilyMetropolis,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ))
          ],
        ),
        Wrap(
          children: _genres.toList(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          ),
        )
      ],
    );
  }

  Iterable<Widget> get _sortByWidgets sync* {
    final filterValue = selectedValue.split(',');
    var _sortByList;
    if (type == AppConstants.movie) {
      _sortByList = AppConstants.movieSortByList;
    } else {
      _sortByList = AppConstants.showSortByList;
    }
    for (final String filter in _sortByList) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(
            filter,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontWeight: FontWeight.w700),
          ),
          shape: StadiumBorder(side: BorderSide()),
          selectedColor: Colors.deepOrangeAccent,
          showCheckmark: false,
          selected: filterValue[1] == filter,
          onSelected: (bool value) {
            _navigateToMoviesShows('${AppConstants.sortBy},$filter');
          },
        ),
      );
    }
  }

  Iterable<Widget> get _genres sync* {
    final filterValue = selectedValue.split(',');
    for (int i = 0; i < _movieShowGenres!.length; i++) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(
            _movieShowGenres![i].name ?? '',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontWeight: FontWeight.w700),
          ),
          shape: StadiumBorder(side: BorderSide()),
          selectedColor: Colors.deepOrangeAccent,
          showCheckmark: false,
          selected: filterValue[1] == (_movieShowGenres![i].id).toString(),
          onSelected: (bool value) {
            _navigateToMoviesShows(
                '${AppConstants.genres},${_movieShowGenres![i].id ?? ''}');
          },
        ),
      );
    }
  }

  Widget _initState() {
    return CommonProgressBar();
  }

  Widget _errorState() {
    return ErrorUI();
  }

  void _navigateToMoviesShows(String filter) {
    Navigator.pop(context, filter);
  }
}
