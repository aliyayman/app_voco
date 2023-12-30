
import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  const myTextField({
    super.key,
    required TextEditingController usernameController,
    required String snackBarMessage,
    required String labelText,
  }) : _usernameController = usernameController,
  _labelText = labelText,
  _snackbarMessage =snackBarMessage;


  final TextEditingController _usernameController;
  final String _snackbarMessage;
  final String _labelText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      decoration:  InputDecoration(
          labelText: _labelText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(24)))),
      validator: (value) {
        if (value!.isEmpty) {
          return _snackbarMessage;
        }
        return null;
      },
    );
  }
}
