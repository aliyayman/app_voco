import 'package:app_voco/utility/constants/constant_padding.dart';
import 'package:app_voco/utility/constants/constant_string.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantString.appTitle),
      ),
      body: Padding(
        padding: ConstantPadding.largeAllPadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(ConstantString.textTitle),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: ConstantString.userName,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(24)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ConstantString.validatorUserMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: ConstantString.password,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(24)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ConstantString.snackbarMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text(ConstantString.buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void loginUser(String text, String text2, BuildContext context) {}
