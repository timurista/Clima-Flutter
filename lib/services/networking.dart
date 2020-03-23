import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  NetworkingHelper(this.url);

  final String url;

  Future getData() async {
    http.Response r = await http.get(url);
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      print(data);
      return data;
    } else {
      print(r.statusCode);
      print(r.body);
    }
  }
}
