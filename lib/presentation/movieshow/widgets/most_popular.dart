import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_bloc.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_event.dart';
import 'package:fun_box/bloc/movieshow/movies_shows_state.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/details/movie_show_details.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

class MostPopular extends StatefulWidget {
  final String type;
  final String filter;

  MostPopular({required this.type, required this.filter});

  @override
  State<StatefulWidget> createState() => _MostPopularState(type, filter);
}

class _MostPopularState extends State<MostPopular> {
  final String type;
  final String filter;
  final MoviesShowsBloc _moviesShowsBloc =
      GetIt.instance.get<MoviesShowsBloc>();
  var _page = 1;

  _MostPopularState(this.type, this.filter);

  @override
  Widget build(BuildContext context) {
    final List<Results> _popularList = [];
    BlocProvider(create: (BuildContext context) => _moviesShowsBloc);
    _moviesShowsBloc.add(MoviesShowsEvent(
        type: type, event: filter, page: _page));
    return BlocBuilder(
        bloc: _moviesShowsBloc,
        builder: (context, state) {
          if (state is InitialMoviesShowsState) {
            return _initState();
          } else if (state is SuccessMoviesShowsState) {
            _page = _page + 1;
            _popularList.addAll(state.record.results!);
            return _showPopular(context, type, _popularList);
          } else if (state is ErrorMoviesShowsState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _showPopular(
      BuildContext context, String type, List<Results> popularList) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final itemWidth = width / 2;
    final ScrollController _scrollController = ScrollController();
    return Container(
      width: width,
      height: height - 120.0,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: GridView.builder(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    _page < AppConstants.maxPages) {
                  _moviesShowsBloc.add(MoviesShowsEvent(
                      type: type, event: filter, page: _page));
                }
              }),
            itemCount: popularList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: itemWidth / (itemWidth + 100),
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0),
            itemBuilder: (context, index) {
              return _popularCell(
                  context,
                  type,
                  popularList[index].id?.toDouble() ?? 0,
                  popularList[index].posterPath ?? '');
            }),
      ),
    );
  }

  Widget _popularCell(
      BuildContext context, String type, double id, String imagePath) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context, type, id),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Image.network(
          '${Configurations.imageUrl}/${Configurations.imageSize}$imagePath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _initState() {
    return CommonProgressBar();
  }

  Widget _errorState() {
    return ErrorUI();
  }

  void _navigateToDetails(BuildContext context, String type, double id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieShowDetails(
        type: type,
        id: id,
      );
    }));
  }
}
