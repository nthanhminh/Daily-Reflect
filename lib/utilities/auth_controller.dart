import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const url = 'http://192.168.76.82:3001/';

enum AuthState {
  SIGNUP_OK,
  SIGNUP_EMAIL_USED,
  LOGIN_OK,
  LOGIN_EMAIL_NOT_EXIST,
  LOGIN_WRONG_PASSWORD,
}

class AuthController {
  static Future<AuthState> signUp(email, password) async {
    var reqBody = {
      "email": email,
      "password": password,
    };
    var response = await http.post(
      Uri.parse('${url}registration'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      return AuthState.SIGNUP_OK;
    }
    return AuthState.SIGNUP_EMAIL_USED;
  }

  static Future<String> login(email, password) async {
    var reqBody = {
      "email": email,
      "password": password,
    };
    var response = await http.post(
      Uri.parse('${url}login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      var token = jsonResponse['token'];
      return token;
    }
    return 'Login error';
  }
}
