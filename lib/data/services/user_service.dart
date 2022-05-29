import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class UserService {
  UserService._();
  static final UserService instance = UserService._();

  static const String baseUrl = 'https://gorest.co.in/public/v2';
  Future<List<User>> getAllUsers() async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl/users'),
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

  Future<void> addUser(User user) async {
    try {
      http.Response response = await http.post(Uri.parse('$baseUrl/users'),
          body: user.toJson(),
          headers: {'Authorization': 'Bearer ${dotenv.env["API_KEY"]}'});
      if (response.statusCode != 201) throw Exception('bad status code');
      // print(response.body);
      // var data = jsonDecode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> updateUser(User user) async {
    try {
      http.Response response = await http.put(
          Uri.parse('$baseUrl/users/${user.id}'),
          body: user.toJson(),
          headers: {'Authorization': 'Bearer ${dotenv.env["API_KEY"]}'});
      if (response.statusCode != 200) throw Exception('bad status code');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<User> getUserById(int id) async {
    try {
      http.Response response = await http.put(Uri.parse('$baseUrl/users/$id'),
          headers: {'Authorization': 'Bearer ${dotenv.env["API_KEY"]}'});
      if (response.statusCode != 200) throw Exception('bad status code');
      var data = jsonDecode(response.body);
      return User.fromJson(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return User(email: "", gender: "", id: 0, name: "", status: "");
    }
  }

  Future<void> deleteUserById(int id) async {
    try {
      http.Response response = await http.delete(
          Uri.parse('$baseUrl/users/$id'),
          headers: {'Authorization': 'Bearer ${dotenv.env["API_KEY"]}'});
      if (response.statusCode != 204) throw Exception('bad status code');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
