import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

Future<void> sharedPreferences() async {
  preferences = await SharedPreferences.getInstance();
}

//save user token
Future<bool> saveUserToken(String userToken) => preferences.setString('userToken', userToken);
Future<bool> removeUserToken() => preferences.remove('userToken');
String? getUserToken() => preferences.getString('userToken');

//save user id
Future<bool> saveUserId(int userId) => preferences.setInt('userId', userId);
Future<bool> removeUserId() => preferences.remove('userId');
int? getUserId() => preferences.getInt('userId');

//save balance
Future<bool> saveBalance(String balance) => preferences.setString('balance', balance);
Future<bool> removeBalance() => preferences.remove('balance');
String? getBalance() => preferences.getString('balance');

//save balance
Future<bool> setMyCurrencies(List<String> myCurrencies) => preferences.setStringList('myCurrencies', myCurrencies);
List<String>? getMyCurrencies() => preferences.getStringList('myCurrencies') ?? [];

//save lang
Future<bool> saveLanguage(String language) => preferences.setString('language', language);
Future<bool> removeLanguage() => preferences.remove('language');
String? getLanguage() => preferences.getString('language');
