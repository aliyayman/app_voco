import 'package:app_voco/pages/login/controller.dart';
import 'package:app_voco/product/utility/constants/constant_padding.dart';
import 'package:app_voco/product/utility/constants/constant_string.dart';
import 'package:app_voco/product/widgets/my_textfield.dart';
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
              myTextField(usernameController: _usernameController,snackBarMessage: ConstantString.validatorUserMessage,labelText: ConstantString.userName  ),
              const SizedBox(height: 16.0),
              myTextField(usernameController: _passwordController,snackBarMessage: ConstantString.snackbarMessage, labelText: ConstantString.password ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    LoginCotroller().loginUser(_usernameController.text,
                        _passwordController.text, context);
                  }
                },
                child: const Text(ConstantString.buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


