import 'package:app_voco/pages/login/login_page.dart';
import 'package:app_voco/pages/user_view/user_page.dart';
import 'package:app_voco/product/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authToken = ref.watch(tokenDataProvider);
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authToken.value == 'QpwL5tke4Pnpja7X4'
          ? const UsersPage()
          : LoginPage(),
    );
  }
}
