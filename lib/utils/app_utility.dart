import 'package:fun_box/utils/app_constants.dart';
import 'package:intl/intl.dart';

class AppUtility {
  static String getYearFromDate(String date) {
    if (date.isNotEmpty) {
      var parseDate = DateTime.parse(date);
      var formatter = DateFormat(AppConstants.yearFormat);
      return formatter.format(parseDate);
    } else {
      return AppConstants.NA;
    }
  }

  static String getCorrectDate(String date) {
    if (date.isNotEmpty) {
      var parseDate = DateTime.parse(date);
      var formatter = DateFormat(AppConstants.dateFormat);
      return formatter.format(parseDate);
    } else {
      return '';
    }
  }
}
