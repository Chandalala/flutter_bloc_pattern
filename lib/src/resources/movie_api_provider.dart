import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {

  http.Client client = http.Client();

  final _apiKey = '1393a272e6f7431fc4ed5b8d31057656';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(Uri.http("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey", ""));

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}