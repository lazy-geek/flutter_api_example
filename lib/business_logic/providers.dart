import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_api_example/data/services/userpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersProvider = FutureProvider<List<User>>((ref) async {
  final content = UserService.instance.getAllUsers();

  return content;
});

final loginStatusProvider = FutureProvider<bool>((ref) async {
  final content = await UserPrefService.instance.isLoggedIn();

  return content;
});
