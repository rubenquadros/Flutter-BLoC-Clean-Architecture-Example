import 'package:flutter/material.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:intl/intl.dart';

class AppUtility {
  static void showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(content: Text('u idiot'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String getYearFromDate(String date) {
    if(date.isNotEmpty) {
      var parseDate = DateTime.parse(date);
      var formatter = DateFormat(AppConstants.yearFormat);
      return formatter.format(parseDate);
    }else {
      return AppConstants.NA;
    }
  }
}
