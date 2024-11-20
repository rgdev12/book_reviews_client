import 'dart:convert';
import '../models/user_model.dart';
import 'base_service.dart';

class UserService extends BaseService {
  Future<User> registerUser(String name, String email, String password) async {
    final response = await post('/user/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return User.fromJson(data['user']);
    } else {
      final data = json.decode(response.body);
      throw Exception(data['message']);
    }
  }
}
