import 'dart:convert';
import 'dart:io';

import 'package:chatgpt_using_openai_api/constants/api_consts.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$BASE_URL/models'),
        headers: {
          'Authorization': 'Bearer $API_KEY',
        },
      );

      Map jsonResponse = jsonDecode(response.body);
      print('jsonResponse: $jsonResponse');

      if (jsonResponse['error'] != null) {
        print("jsonResponse['error']${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
    } catch (error) {
      print('error$error');
    }
  }
}
