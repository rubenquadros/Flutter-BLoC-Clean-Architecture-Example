import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/all/movies_shows_bloc.dart';
import 'package:fun_box/bloc/all/movies_shows_event.dart';
import 'package:fun_box/bloc/all/movies_shows_state.dart';
import 'package:get_it/get_it.dart';

class TrendingMoviesShows extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TrendingMoviesShowsState();
}

class _TrendingMoviesShowsState extends State<TrendingMoviesShows> {

  final MoviesShowsBloc _moviesShowsBloc = GetIt.instance.get<MoviesShowsBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _moviesShowsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _moviesShowsBloc);
    _moviesShowsBloc.add(MoviesShowsEvent.all);
    return BlocBuilder<MoviesShowsBloc, MoviesShowsState>(
      bloc: _moviesShowsBloc,
      builder: (context, state) {
        if (state is InitialMoviesShowsState) {
          return _progressBar();
        } else if (state is SuccessMoviesShowsState) {
          return _tendingMoviesShows(state.record);
        } else if (state is ErrorMoviesShowsState) {
          return _error();
        } else {
          return _random();
        }
      },
    );
  }

  Widget _tendingMoviesShows(MoviesShowsRecord moviesShows) {
    return Center(
      child: Text(moviesShows.totalPages.toString()),
    );
  }

  Widget _progressBar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error() {
    return Center(
      child: Text('Error'),
    );
  }

  Widget _random() {
    return Center(
      child: Text('Random state'),
    );
  }
}
