import 'package:flutter/material.dart';

class TextFormFeldLogin extends StatefulWidget {
  const TextFormFeldLogin({super.key});

  @override
  State<TextFormFeldLogin> createState() => _TextFormFeldLoginState();
}

class _TextFormFeldLoginState extends State<TextFormFeldLogin> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      validator: (text) {
        if (text == null) return '';
        if (text.length < 6) {
          return 'Mật khẩu quá ngắn';
        }
        return null;
      },
    );
  }
}
