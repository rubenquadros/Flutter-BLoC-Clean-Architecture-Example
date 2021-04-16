import 'package:domain/model/person_info_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/person/person_details_bloc.dart';
import 'package:fun_box/bloc/person/person_details_event.dart';
import 'package:fun_box/bloc/person/person_details_state.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/ui_constants.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:fun_box/utils/app_utility.dart';
import 'package:get_it/get_it.dart';

class PersonInfo extends StatefulWidget {
  final double id;

  PersonInfo({required this.id});

  @override
  State<StatefulWidget> createState() => _PersonInfoState(id);
}

class _PersonInfoState extends State<PersonInfo> {
  final double id;
  final PersonDetailsBloc _personDetailsBloc =
      GetIt.instance.get<PersonDetailsBloc>();

  _PersonInfoState(this.id);

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _personDetailsBloc);
    _personDetailsBloc
        .add(PersonDetailsEvent(type: AppConstants.personalInfo, id: id));
    return BlocBuilder(
        bloc: _personDetailsBloc,
        builder: (context, state) {
          if (state is InitialPersonDetailsState) {
            return _initState();
          } else if (state is SuccessPersonInfoState) {
            return _showPersonalInfo(context, state.record);
          } else if (state is ErrorPersonDetailsState) {
            return _errorState();
          } else {
            return _errorState();
          }
        });
  }

  Widget _showPersonalInfo(
      BuildContext context, PersonInfoRecord personalInfo) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => _navigateToHomeScreen(context),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 40.0,
              ),
            ),
          ),
        ),
        Center(
          child: CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.black12,
            backgroundImage: NetworkImage(
                '${Configurations.imageUrl}/${Configurations.imageSize}${personalInfo.profilePath}'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              personalInfo.name ?? '',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: UIConstants.fontFamilyMetropolis,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            personalInfo.placeOfBirth ?? '',
            style: TextStyle(
                color: Colors.black,
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: Text(
            AppUtility.getCorrectDate(personalInfo.birthday ?? ''),
            style: TextStyle(
                color: Colors.black,
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            personalInfo.biography ?? '',
            style: TextStyle(
                color: Colors.black,
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
        ))
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
}
