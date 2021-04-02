import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/all/movies_shows_bloc.dart';
import 'package:fun_box/bloc/all/movies_shows_event.dart';
import 'package:fun_box/bloc/all/movies_shows_state.dart';
import 'package:fun_box/config/configurations.dart';
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
          return _tendingMoviesShows(context, state.record);
        } else if (state is ErrorMoviesShowsState) {
          return _error();
        } else {
          return _random();
        }
      },
    );
  }

  Widget _tendingMoviesShows(BuildContext context,
      MoviesShowsRecord moviesShows) {
    final width = MediaQuery.of(context).size.width;
    ScrollController _scrollController = ScrollController();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Trending today',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'iron',
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
        Container(
          height: width / 2,
          width: width,
          margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: moviesShows.results?.length,
              itemBuilder: (context, index) {
                return _trendingMoviesShowsCell(
                    moviesShows.results ? [index].posterPath ?? "", width / 2);
              }),
        )
      ],
    );
  }

  Widget _trendingMoviesShowsCell(String imagePath, double size) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0)
        )
      ),
      child: Image.network(
        '${Configurations.imageUrl}/${Configurations.imageSize}$imagePath',
        fit: BoxFit.cover,
      ),
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
