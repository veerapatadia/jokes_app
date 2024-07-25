import 'dart:convert';
import 'package:advjokeapp/model/api_jokesmodel.dart';
import 'package:advjokeapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelper = ApiHelpers._();

  Future<List<Jokes>?> getjokes() async {
    http.Response response = await http.get(
      Uri.parse(RANDOM_API),
    );

    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);

      List<Jokes> allJokes =
          decodedData.map((e) => Jokes.fromMap(data: e)).toList();

      return allJokes;
    }
  }
}
