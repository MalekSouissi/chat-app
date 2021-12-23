// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';


saveAccessTokenSharedPref(String token, String userid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('userid', userid);
}

Future<String?> getUserInfoSharedPref(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}