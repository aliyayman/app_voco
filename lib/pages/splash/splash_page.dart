import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:app_voco/pages/login/login_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user_view/user_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin<SplashPage> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    var isRedirectUsePage = _isRedirectUsePage(context);
    isRedirectUsePage.then((value) => value
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UsersPage()),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }

  Future<bool> _isRedirectUsePage(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    var rememberMe = prefs.getBool('isLogin') ?? false;
    var token = prefs.getString('token');
    var isRedirectDashboard = rememberMe && token != null;
    return isRedirectDashboard;
  }
}
