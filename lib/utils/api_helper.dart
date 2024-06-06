import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/home_model.dart';

class APIHelper {
  static APIHelper helper = APIHelper._();

  APIHelper._();

  Future<HomeModel?> getData(String question) async {
    String apiLink = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCdkMQqO3j74C7YFRhzlVwK1BBmHe_HLi0";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": question}
          ]
        }
      ]
    });

    var response = await http.post(
      Uri.parse(apiLink),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      HomeModel? homeModel = HomeModel.mapToModel(json);

      // print(json);
      return homeModel;
    }
    return null;
  }
}
