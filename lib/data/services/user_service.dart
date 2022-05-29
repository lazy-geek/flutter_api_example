import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class UserService {
  UserService._();
  static final UserService instance = UserService._();

  static const String baseUrl = 'https://gorest.co.in/public/v2';
//  dotenv.env['API_URL']
  Future<List<User>> getAllUsers() async {
    try {
      http.Response response = await http.get(Uri.parse('${baseUrl}/users'),
          headers: {'Authorization': 'Bearer ${dotenv.env["API_KEY"]}'});
      if (response.statusCode != 200) throw Exception('bad status code');
      var data = jsonDecode(response.body);
      List<User> users = [];
      for (var item in data) {
        users.add(User.fromJson(item));
      }
      return users;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<void> updateUser(User user) async {
    try {
      http.Response response = await http.put(
          Uri.parse('${baseUrl}/users/${user.id}'),
          body: user.toJson(),
          headers: {'Authorization': 'Bearer ${dotenv.env["API_KEY"]}'});
      if (response.statusCode != 200) throw Exception('bad status code');
      print(response.body);
      var data = jsonDecode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
