import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://192.168.1.36:8000/api/time_records';

  postData(data) async {
    var fullUrl = _url;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
