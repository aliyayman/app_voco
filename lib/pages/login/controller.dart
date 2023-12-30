import 'dart:convert';
import 'package:app_voco/pages/user_view/user_page.dart';
import 'package:app_voco/product/utility/constants/constant_string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCotroller {
  Future<void> loginUser(String username, String password, context) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setBool('isLogin', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UsersPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(ConstantString.snackbarMessage),
        ),
      );
    }
  }
}
