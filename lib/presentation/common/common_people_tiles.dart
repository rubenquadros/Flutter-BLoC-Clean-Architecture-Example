import 'package:domain/model/trending_people_record.dart';
import 'package:flutter/material.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/presentation/person/person_details.dart';

class CommonPeopleTiles extends StatelessWidget {
  final double radius;
  final double width;
  final int itemCount;
  final List<Results>? results;

  CommonPeopleTiles(
      {required this.radius,
      required this.width,
      required this.itemCount,
      required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width / 2,
      width: width,
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return _trendingPeopleCell(
                context,
                results?[index].profilePath ?? '',
                results?[index].id?.toDouble() ?? 0);
          }),
    );
  }

  Widget _trendingPeopleCell(
      BuildContext context, String imagePath, double id) {
    return GestureDetector(
      onTap: () => _navigateToPersonDetails(context, id),
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

  void _navigateToPersonDetails(BuildContext context, double id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PersonDetails(id: id);
    }));
  }
}
