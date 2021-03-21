import 'package:flutter/material.dart';
import 'package:fun_box/presentation/common/common_search_bar.dart';
import 'package:fun_box/presentation/home/trending_movies_shows.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: [
        CommonSearchBar(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TrendingMoviesShows(),
        )
      ],
    ));
  }
}
