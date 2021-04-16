import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/details/movie_show_details.dart';

class CommonDisplayTiles extends StatelessWidget {
  final double width;
  final int itemCount;
  final List<Results>? results;
  final String type;

  CommonDisplayTiles(
      {required this.width,
      required this.itemCount,
      required this.results,
      required this.type});

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
                context,
                results?[index].posterPath ?? '',
                type,
                results?[index].id?.toDouble() ?? 0);
          }),
    );
  }

  Widget _trendingMoviesShowsCell(
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

  void _navigateToDetails(BuildContext context, String type, double id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieShowDetails(
        type: type,
        id: id,
      );
    }));
  }
}
