import 'dart:math';

import 'package:domain/model/movie_details_record.dart';
import 'package:domain/model/show_details_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/details/movie_show_details_bloc.dart';
import 'package:fun_box/bloc/details/movie_show_details_event.dart';
import 'package:fun_box/bloc/details/movie_show_details_state.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/ui_constants.dart';
import 'package:fun_box/presentation/video/movie_show_trailer.dart';
import 'package:fun_box/utils/app_utility.dart';
import 'package:get_it/get_it.dart';

class MovieShowInfo extends StatefulWidget {
  final String type;
  final double id;

  MovieShowInfo({required this.type, required this.id});

  @override
  State<StatefulWidget> createState() => _MovieShowInfoState(type, id);
}

class _MovieShowInfoState extends State<MovieShowInfo> {
  final String type;
  final double id;
  final MovieShowDetailsBloc _movieShowDetailsBloc =
      GetIt.instance.get<MovieShowDetailsBloc>();

  _MovieShowInfoState(this.type, this.id);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _movieShowDetailsBloc);
    _movieShowDetailsBloc.add(MovieShowDetailsEvent(type: type, id: id));
    return BlocBuilder<MovieShowDetailsBloc, MovieShowDetailsState>(
        bloc: _movieShowDetailsBloc,
        builder: (context, state) {
          if (state is InitialMovieShowDetailsState) {
            return _initState();
          } else if (state is SuccessMovieDetailsState) {
            return _movieDetails(context, state.record, type, id);
          } else if (state is SuccessShowDetailsState) {
            return _showDetails(context, state.record, type, id);
          } else if (state is ErrorMovieShowDetailsState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _movieDetails(BuildContext context, MovieDetailsRecord movieDetails,
      String type, double id) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var genres = '';
    if (movieDetails.genres != null && movieDetails.genres!.length > 0) {
      for (var i = 0; i < movieDetails.genres!.length; i++) {
        genres = genres + movieDetails.genres![i].name!.trim();
        if (i != movieDetails.genres!.length - 1) {
          genres = '$genres, ';
        }
      }
    }
    return ListView(
      shrinkWrap: true,
      children: [
        _backdropView(context, movieDetails.posterPath ?? '', height / 3, width,
            type, id),
        _infoView(genres, movieDetails.title ?? '', movieDetails.overview ?? '',
            movieDetails.voteAverage, movieDetails.releaseDate ?? '')
      ],
    );
  }

  Widget _showDetails(BuildContext context, ShowDetailsRecord showDetails,
      String type, double id) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var genres = '';
    if (showDetails.genres != null && showDetails.genres!.length > 0) {
      for (var i = 0; i < showDetails.genres!.length; i++) {
        genres = genres + showDetails.genres![i].name!.trim();
        if (i != showDetails.genres!.length - 1) {
          genres = '$genres, ';
        }
      }
    }
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _backdropView(
            context, showDetails.posterPath ?? '', height / 3, width, type, id),
        _infoView(genres, showDetails.name ?? '', showDetails.overview ?? '',
            showDetails.voteAverage, showDetails.firstAirDate ?? ''),
        _seasonView(showDetails.numberOfSeasons.toString(),
            showDetails.numberOfEpisodes.toString())
      ],
    );
  }

  Widget _backdropView(BuildContext context, String imagePath, double height,
      width, String type, double id) {
    return Container(
      height: height + 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              height: height,
              width: width,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 5.0,
                child: Image.network(
                  '${Configurations.imageUrl}/${Configurations.imageSize}$imagePath',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => _navigateToHomeScreen(context),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 40.0,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 20.0,
              child: FloatingActionButton(
                elevation: 20.0,
                backgroundColor: Colors.white,
                onPressed: () {
                  debugPrint('Clicked');
                  _navigateToTrailerScreen(context, type, id);
                },
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.red,
                  size: 40.0,
                ),
              ))
        ],
      ),
    );
  }

  Widget _infoView(String genres, String title, String overView, double? rating,
      String releaseDate) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: UIConstants.fontFamilyMetropolis,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                genres,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: UIConstants.fontFamilyMetropolis,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(overView,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: UIConstants.fontFamilyMetropolis,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      UIConstants.rating,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: UIConstants.fontFamilyMetropolis,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      rating.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: UIConstants.fontFamilyMetropolis,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      UIConstants.release,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: UIConstants.fontFamilyMetropolis,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(AppUtility.getYearFromDate(releaseDate),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: UIConstants.fontFamilyMetropolis,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _seasonView(String seasons, String episodes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, right: 8.0),
              child: Text(
                UIConstants.seasons,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: UIConstants.fontFamilyMetropolis,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                seasons,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: UIConstants.fontFamilyMetropolis,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                UIConstants.episodes,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: UIConstants.fontFamilyMetropolis,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                episodes,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: UIConstants.fontFamilyMetropolis,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
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

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pop(context);
  }

  void _navigateToTrailerScreen(BuildContext context, String type, double id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieShowTrailer(type: type, id: id);
    }));
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 1 / 5;
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);
    final path = Path();
    path.addRect(filledRectangle);
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
