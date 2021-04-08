import 'package:flutter/material.dart';
import 'package:fun_box/presentation/ui_constants.dart';

class ErrorUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('images/error_image.png'),
              width: 125.0,
              height: 125.0,
            ),
          ),
          Text(
            UIConstants.errorMessage,
            style: TextStyle(
                fontSize: 14.0,
                fontFamily: UIConstants.fontFamilyIronclad,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
