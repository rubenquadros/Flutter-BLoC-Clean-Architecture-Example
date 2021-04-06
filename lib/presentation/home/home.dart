import 'package:flutter/material.dart';
import 'package:fun_box/presentation/common/common_search_bar.dart';
import 'package:fun_box/presentation/home/widgets/trending_movies.dart';
import 'package:fun_box/presentation/home/widgets/trending_people.dart';
import 'package:fun_box/presentation/home/widgets/trending_shows.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: ListView(
      children: [
        CommonSearchBar(),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: TrendingMovies(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: TrendingShows(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: TrendingPeople(),
        )
      ],
    )));
  }
}
