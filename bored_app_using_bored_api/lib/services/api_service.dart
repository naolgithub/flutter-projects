import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bored_app_using_bored_api/utils/api_constants.dart';
import 'package:http/http.dart' as http;

import '../models/activity.dart';

class ApiService {
  static Future<Activity> getData(String type) async {
    try {
      var response = await http.get(Uri.parse('$baseUrl$type'));
      var jsonResponse = jsonDecode(response.body);
      //print('jsonResponse: $jsonResponse');
      log('jsonResponse: $jsonResponse');
      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error']${jsonResponse['error']}");
        log("jsonResponse['error']${jsonResponse['error']}");
        throw HttpException(jsonResponse['error']);
      }
      return Activity.fromJson(jsonResponse);
    } catch (error) {
      // print('error$error');
      log('error$error');
      rethrow;
    }
  }
}
