import 'package:domain/model/cast_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/cast/movie_show_cast_bloc.dart';
import 'package:fun_box/bloc/cast/movie_show_cast_event.dart';
import 'package:fun_box/bloc/cast/movie_show_cast_state.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/person/person_details.dart';
import 'package:fun_box/presentation/ui_constants.dart';
import 'package:get_it/get_it.dart';

class MovieShowCast extends StatefulWidget {
  final String type;
  final double id;

  MovieShowCast({required this.type, required this.id});

  @override
  State<StatefulWidget> createState() => _MovieShowCastState(type, id);
}

class _MovieShowCastState extends State<MovieShowCast> {
  final String type;
  final double id;
  MovieShowCastBloc _movieShowCastBloc =
      GetIt.instance.get<MovieShowCastBloc>();

  _MovieShowCastState(this.type, this.id);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _movieShowCastBloc);
    _movieShowCastBloc.add(MovieShowCastEvent(type: type, id: id));
    return BlocBuilder<MovieShowCastBloc, MovieShowCastState>(
        bloc: _movieShowCastBloc,
        builder: (context, state) {
          if (state is InitialMovieShowCastState) {
            return _initState();
          } else if (state is SuccessMovieShowCastState) {
            return _showCast(context, state.record);
          } else if (state is ErrorMovieShowCastState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _showCast(BuildContext context, CastRecord cast) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            UIConstants.cast,
            style: TextStyle(
                color: Colors.black,
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        _castView(context, cast)
      ],
    );
  }

  Widget _castView(BuildContext context, CastRecord castCrew) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      width: width,
      height: width / 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: castCrew.cast?.length,
          itemBuilder: (context, index) {
            return _castViewCell(
                context,
                castCrew.cast?[index].id?.toDouble() ?? 0,
                castCrew.cast?[index].name ?? '',
                castCrew.cast?[index].profilePath ?? '',
                castCrew.cast?[index].character ?? '');
          }),
    );
  }

  Widget _castViewCell(BuildContext context, double id, String name,
      String imagePath, String characterName) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: GestureDetector(
            onTap: () => _navigateToPersonDetails(context, id, imagePath),
            child: CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  '${Configurations.imageUrl}/${Configurations.imageSize}$imagePath'),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: 140,
            height: 30.0,
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: UIConstants.fontFamilyMetropolis,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )),
      ],
    );
  }

  Widget _initState() {
    return CommonEmptyInit();
  }

  Widget _errorState() {
    return ErrorUI();
  }

  void _navigateToPersonDetails(
      BuildContext context, double id, String imagePath) {
    if (imagePath.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PersonDetails(id: id);
      }));
    }
  }
}
