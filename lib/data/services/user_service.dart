import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_example/data/models/user.dart';

import 'package:http/http.dart' as http;

class UserService {
  UserService._();
  static final UserService instance = UserService._();

  static const String baseUrl = 'https://gorest.co.in/public/v2';

  Future<List<User>> getAllUsers() async {
    try {
      http.Response response = await http.get(Uri.parse('${baseUrl}/users'));
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
}
