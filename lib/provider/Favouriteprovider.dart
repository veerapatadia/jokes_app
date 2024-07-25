import 'package:advjokeapp/model/api_jokesmodel.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<Jokes> favoriteJokes = [];
  bool isFavourite = false;

  void addJokes(Jokes jokes) {
    favoriteJokes.add(jokes);
    notifyListeners();
  }

  void removeJokes(Jokes jokes) {
    favoriteJokes.remove(jokes);
    notifyListeners();
  }
}
