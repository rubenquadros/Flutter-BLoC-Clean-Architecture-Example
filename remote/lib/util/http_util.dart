import 'dart:convert';

import 'package:http/http.dart';
import 'package:remote/util/api_constants.dart';

class HttpUtil {

  static dynamic getResponse(Response response) {
    switch(response.statusCode) {
      case ApiConstants.http_success:
        return _getSuccessResponse(response);
      default:
        return Exception('Remote Error');
    }
  }

  static dynamic _getSuccessResponse(Response response) {
    final _responseJson = json.decode(response.body);
    print('Response: $_responseJson');
    return _responseJson;
  }

}