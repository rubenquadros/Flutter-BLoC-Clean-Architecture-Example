import 'package:flutter/material.dart';

import '../ui_constants.dart';

class CommonSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
        data: ThemeData(primaryColor: Colors.deepOrangeAccent),
        child: TextField(
          style: TextStyle(
            fontFamily: 'iron',
            fontWeight: FontWeight.w400,
            fontSize: 16.0
          ),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: UIConstants.search_hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          onTap: () {
            debugPrint('clicked search');
          },
        ),
      ),
    );
  }

}