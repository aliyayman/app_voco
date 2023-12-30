import 'dart:convert';

import 'package:app_voco/pages/user_view/user_model.dart';
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiServices {
  String endpoint = 'https://reqres.in/api/users?page=2';
  Future<List<User>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => User.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<String> getToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.get('token').toString();
}
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
final tokenProvider = Provider<ApiServices>((ref) => ApiServices());
