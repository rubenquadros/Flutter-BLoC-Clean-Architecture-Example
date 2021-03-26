import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:remote/util/http_util.dart';

class HttpClient {
  final bearer =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MzRjNDliM2EwOWUzNzMwM2YxNmJmMjQxNDMyOTIyZCIsInN1YiI6IjYwM2E5M2E5YzJmZjNkMDA1MjA2MzIwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.o6T32zw2hIBReqzSDx7hmBRsjUdma-IyTCY7bm-1lCM';

  Future<dynamic> get({required String url}) async {
    var response = await http.get(Uri.parse(url), headers: _getHeaders());
    return HttpUtil.getResponse(response);
  }

  Map<String, String> _getHeaders() {
    final headers = <String, String>{};
    headers[HttpHeaders.authorizationHeader] = 'Bearer $bearer';
    return headers;
  }
}
