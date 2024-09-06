import 'dart:convert';

import 'package:http/http.dart' as http;

class fatchapi {
  final String apikeys = "c0428e5dacb8f7dbf37711ded1dcec1a";
  Future<List<dynamic>> fatchdata() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apikeys'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['results'];
    } else {
      throw Exception('ERROR');
    }
  }
  
  Future<List<dynamic>> fatchdata2() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikeys'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['results'];
    } else {
      throw Exception('ERROR');
    }
  }
}