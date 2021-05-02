import 'package:flutter/material.dart';
import 'package:fun_box/presentation/filter/movies_shows_filters.dart';

import '../ui_constants.dart';

class Filters extends StatefulWidget {
  final String type;
  final String selectedValue;

  Filters({required this.type, required this.selectedValue});

  @override
  State<StatefulWidget> createState() => _FiltersState(type, selectedValue);
}

class _FiltersState extends State<Filters> {
  final String type;
  final String selectedValue;

  _FiltersState(this.type, this.selectedValue);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _navigateToMoviesShows(context),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.clear_rounded,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                    child: Center(
                      child: Text(
                        UIConstants.filters,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: UIConstants.fontFamilyIronclad,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            MoviesShowsFilters(type: type, selectedValue: selectedValue)
          ],
        ),
      ),
    );
  }

  void _navigateToMoviesShows(BuildContext context) {
    Navigator.pop(context, '');
  }
}
