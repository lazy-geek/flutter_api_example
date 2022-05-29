import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersProvider = FutureProvider<List<User>>((ref) async {
  final content = UserService.instance.getAllUsers();

  return content;
});
