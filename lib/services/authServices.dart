// ignore_for_file: file_names

import 'dart:convert';
import 'package:chat_app/screens/shared/sharedPrefKeys.dart';
import 'package:http/http.dart' as http;

class AuthServices{
  static const _url = 'http://10.0.0.2:8080/api/auth/';


  static Future<http.Response> login(body) async {

    final response = await http.post(Uri.parse(_url + '/signin'),
        body: jsonEncode(body), headers: {"Content-type": "application/json"});
    print(jsonEncode(body));

    if (response.statusCode == 200) {
      String token = json.decode(response.body.toString())['accessToken'];
      String userId = json.decode(response.body.toString())['id'];
     // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      //debugPrint(decodedToken.toString());
      await saveAccessTokenSharedPref(token, userId);
    }

    return response;
  }

  static Future<http.Response> register(body) async {

    final response = await http.post(Uri.parse(_url + '/signup'),
        body: jsonEncode(body), headers: {"Content-type": "application/json"});
    print(jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else {
      throw Exception('exception occured!!!!!!');
    }
  }
}