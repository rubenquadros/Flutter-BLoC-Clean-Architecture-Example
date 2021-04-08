import 'package:domain/model/person_credits_record.dart';
import 'package:domain/model/person_info_record.dart';
import 'package:domain/usecase/person/person_credits_use_case.dart';
import 'package:domain/usecase/person/person_info_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/person/person_details_event.dart';
import 'package:fun_box/bloc/person/person_details_state.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  final PersonInfoUseCase personInfoUseCase;
  final PersonCreditsUseCase personCreditsUseCase;

  PersonDetailsBloc(this.personInfoUseCase, this.personCreditsUseCase)
      : super(InitialPersonDetailsState());

  @override
  Stream<PersonDetailsState> mapEventToState(PersonDetailsEvent event) async* {
    switch (event.type) {
      case AppConstants.personalInfo:
        yield* _fetchPersonalInfo(event.id);
        break;
      case AppConstants.credits:
        yield* _fetchCredits(event.id);
        break;
      default:
        break;
    }
  }

  Stream<PersonDetailsState> _fetchPersonalInfo(double id) async* {
    try {
      var response = await personInfoUseCase.getPersonIfo(id: id);
      yield SuccessPersonInfoState(PersonInfoRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorPersonDetailsState();
    }
  }

  Stream<PersonDetailsState> _fetchCredits(double id) async* {
    try {
      var response = await personCreditsUseCase.getPersonCredits(id: id);
      yield SuccessPersonCreditsState(PersonCreditsRecord.fromJson(response));
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
      yield ErrorPersonDetailsState();
    }
  }
}
