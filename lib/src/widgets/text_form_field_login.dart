import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/string_helper.dart';

class TextFormFeldLogin extends StatefulWidget {
  const TextFormFeldLogin({super.key, this.hintext, this.onChange});
  final String? hintext;
  final Function(String?)? onChange;
  @override
  State<TextFormFeldLogin> createState() => _TextFormFeldLoginState();
}

class _TextFormFeldLoginState extends State<TextFormFeldLogin> {
  GlobalKey<FormFieldState> pwStateKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: pwStateKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChange,
        decoration: InputDecoration(
            hintText: widget.hintext,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        validator: (value) {
          if (widget.hintext == tr('login.hintex_email') &&
              !StringHelper.isEmail(value!)) {
            return tr('login.error_email');
          }
          if (widget.hintext == tr('login.hintex_password') &&
              !StringHelper.isPassword(value!)) {
            return tr('login.error_password');
          }
          return null;
        },
      ),
    );
  }
}
