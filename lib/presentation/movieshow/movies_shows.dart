import 'package:flutter/material.dart';
import 'package:fun_box/presentation/common/common_search_bar.dart';
import 'package:fun_box/presentation/filter/filters.dart';
import 'package:fun_box/presentation/movieshow/widgets/most_popular.dart';
import 'package:fun_box/utils/app_constants.dart';

class MoviesShows extends StatefulWidget {
  final String type;

  MoviesShows({required this.type});

  @override
  State<StatefulWidget> createState() => _MoviesShowsState(type);
}

class _MoviesShowsState extends State<MoviesShows> {
  final String type;
  var filter = '${AppConstants.sortBy},${AppConstants.popular}';

  _MoviesShowsState(this.type);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => _navigateToHome(context),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(child: CommonSearchBar()),
                GestureDetector(
                  onTap: () => _navigateToFilters(context),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.filter_list_rounded,
                        size: 30.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            MostPopular(type: type, filter: filter)
          ],
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pop(context);
  }

  void _navigateToFilters(BuildContext context) async {
    var result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Filters(type: type, selectedValue: filter);
    }));

    if(result != '') {
      setState(() {
        filter = result;
      });
    }
  }
}
