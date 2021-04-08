import 'package:flutter/material.dart';
import 'package:fun_box/presentation/person/widgets/person_credits.dart';
import 'package:fun_box/presentation/person/widgets/person_info.dart';

class PersonDetails extends StatefulWidget {
  final double id;

  PersonDetails({required this.id});

  @override
  State<StatefulWidget> createState() => _PersonDetailsState(id);
}

class _PersonDetailsState extends State<PersonDetails> {
  final double id;

  _PersonDetailsState(this.id);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            PersonInfo(id: id),
            PersonCredits(id: id)
          ],
        ),
      ),
    );
  }

}