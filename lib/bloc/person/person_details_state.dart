import 'package:domain/model/person_credits_record.dart';
import 'package:domain/model/person_info_record.dart';

abstract class PersonDetailsState {}

class InitialPersonDetailsState extends PersonDetailsState {}

class SuccessPersonInfoState extends PersonDetailsState {
  final PersonInfoRecord record;

  SuccessPersonInfoState(this.record);
}

class SuccessPersonCreditsState extends PersonDetailsState {
  final PersonCreditsRecord record;

  SuccessPersonCreditsState(this.record);
}

class ErrorPersonDetailsState extends PersonDetailsState {}
