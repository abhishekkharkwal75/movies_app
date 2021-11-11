import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/services/endpoints.dart';

class HomePageController extends ChangeNotifier {
  List directors = [];
  List result = [];
  bool isloading = false;

  getMovies(BuildContext context) async {
    this.isloading = true;
    notifyListeners();
    Map body = {"category": "movies", "language": "kannada", "genre": "all", "sort": "voting"};

    try {
      final response = await post(movieApi,
          body: jsonEncode(body), headers: {"Content-Type": "application/json"});
      Map data = jsonDecode(response.body);
      this.isloading = false;
      //   for ()
      print(data);
      result = data["result"];
      notifyListeners();
    } catch (e) {
      this.isloading = false;
      notifyListeners();
      print(e);
    }
  }
}
