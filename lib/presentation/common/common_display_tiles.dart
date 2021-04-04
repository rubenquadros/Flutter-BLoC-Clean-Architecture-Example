import 'package:domain/model/trending_record.dart';
import 'package:flutter/material.dart';
import 'package:fun_box/config/configurations.dart';

class CommonDisplayTiles extends StatelessWidget {
  final double width;
  final int itemCount;
  final List<Results>? results;

  CommonDisplayTiles(
      {required this.width, required this.itemCount, required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width / 2,
      width: width,
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return _trendingMoviesShowsCell(
                results?[index].posterPath ?? "");
          }),
    );
  }
}

Widget _trendingMoviesShowsCell(String imagePath) {
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Image.network(
      '${Configurations.imageUrl}/${Configurations.imageSize}$imagePath',
      fit: BoxFit.cover,
    ),
  );
}
