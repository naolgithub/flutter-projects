import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_using_openai_api/constants/api_consts.dart';
import 'package:chatgpt_using_openai_api/models/chat_model.dart';
import 'package:chatgpt_using_openai_api/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
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
        // print("jsonResponse['error']${jsonResponse['error']["message"]}");

        // print("jsonResponse['error']${jsonResponse['error']["type"]}");
        // print("jsonResponse['error']${jsonResponse['error']["param"]}");
        // print("jsonResponse['error']${jsonResponse['error']["code"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        // log('temp${value['id']}');
        // print('temp${value['id']}');
      }
      return ModelsModel.modelFromSnapshot(temp);
    } catch (error) {
      // print('error$error');
      log('error$error');
      rethrow;
    }
    // return [];
  }

//send message fct
  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse('$BASE_URL/completions'),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'model': modelId,
            'prompt': message,
            'max_tokens': 100,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);
      // print('jsonResponse: $jsonResponse');
      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error']${jsonResponse['error']["message"]}");
        // print("jsonResponse['error']${jsonResponse['error']["type"]}");
        // print("jsonResponse['error']${jsonResponse['error']["param"]}");
        // print("jsonResponse['error']${jsonResponse['error']["code"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        // log('jsonResponse[choices][text] ${jsonResponse['choices'][0]['text']}');
        chatList = List.generate(
          jsonResponse['choices'].length,
          (index) => ChatModel(
            msg: jsonResponse['choices'][index]['text'],
            chatIndex: 1,
          ),
        );
        return chatList;
      }
    } catch (error) {
      // print('error$error');
      log('error$error');
      rethrow;
    }
    return [];
  }
}
