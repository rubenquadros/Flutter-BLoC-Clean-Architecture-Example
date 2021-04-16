import 'package:domain/model/person_credits_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/person/person_details_bloc.dart';
import 'package:fun_box/bloc/person/person_details_event.dart';
import 'package:fun_box/bloc/person/person_details_state.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/details/movie_show_details.dart';
import 'package:fun_box/presentation/ui_constants.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

class PersonCredits extends StatefulWidget {
  final double id;

  PersonCredits({required this.id});

  @override
  State<StatefulWidget> createState() => _PersonCreditsState(id);
}

class _PersonCreditsState extends State<PersonCredits> {
  final double id;
  final PersonDetailsBloc _personDetailsBloc =
      GetIt.instance.get<PersonDetailsBloc>();

  _PersonCreditsState(this.id);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _personDetailsBloc);
    _personDetailsBloc
        .add(PersonDetailsEvent(type: AppConstants.credits, id: id));
    return BlocBuilder(
        bloc: _personDetailsBloc,
        builder: (context, state) {
          if (state is InitialPersonDetailsState) {
            return _initState();
          } else if (state is SuccessPersonCreditsState) {
            return _showCredits(context, state.record);
          } else if (state is ErrorPersonDetailsState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _showCredits(BuildContext context, PersonCreditsRecord credits) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              UIConstants.popular,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: UIConstants.fontFamilyMetropolis,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        _showPopular(context, credits)
      ],
    );
  }

  Widget _showPopular(BuildContext context, PersonCreditsRecord credits) {
    final width = MediaQuery.of(context).size.width;
    var _itemCount = 0;
    if (credits.cast != null && credits.cast!.length < 10) {
      _itemCount = credits.cast!.length;
    } else {
      _itemCount = 10;
    }
    return Container(
      height: width / 2,
      width: width,
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            var type = '';
            if (credits.cast?[index].mediaType == AppConstants.movie) {
              type = AppConstants.movie;
            } else {
              type = AppConstants.tvShow;
            }
            return _popularCell(context, credits.cast?[index].posterPath ?? '',
                type, credits.cast?[index].id?.toDouble() ?? 0);
          }),
    );
  }

  Widget _popularCell(
      BuildContext context, String imagePath, String type, double id) {
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
    return CommonEmptyInit();
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
