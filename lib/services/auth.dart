import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class Auth {
  final baseUrl = 'http://isn-manager.herokuapp.com';
  static final session = FlutterSession();
  Future<dynamic> login(String email, String password) async {
    try {
      var res = await http.post('$baseUrl/api/auth',
          body: {'email': email, 'password': password});
      return res?.body;
    } catch (e) {}
  }

  static setToken(String token) async {
    await session.set('x-auth-token', token);
  }

  static Future<String> getToken() async {
    return await session.get('x-auth-token');
  }

  static removeToken() async {
    await session.prefs.clear();
  }
}
