import 'dart:convert';
import '../models/user_model.dart';
import 'base_service.dart';

class UserService extends BaseService {
  Future<User> registerUser(String name, String email, String password) async {
    final response = await post('/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    // print(response);

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }
}
