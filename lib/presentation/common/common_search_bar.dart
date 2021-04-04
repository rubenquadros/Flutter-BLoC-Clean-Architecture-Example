import 'package:flutter/material.dart';
import 'package:fun_box/config/configurations.dart';
import 'package:fun_box/utils/app_constants.dart';

import '../ui_constants.dart';

class CommonSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
        data: ThemeData(primaryColor: Colors.black),
        child: TextField(
          focusNode: SearchFocusNode(),
          style: TextStyle(
              fontFamily: 'iron', fontWeight: FontWeight.w400, fontSize: 16.0),
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

class SearchFocusNode extends FocusNode {
  @override
  bool get hasFocus {
    return Configurations.configStatus == AppConstants.remoteConfig;
  }
}
