import 'package:flutter/material.dart';

import 'text_field_container.dart';
import '../constraints.dart';

class RoundedFieldPassword extends StatefulWidget {
  final ValueChanged<String> onchanged;
  const RoundedFieldPassword({
    Key? key,
    required this.onchanged,
  }) : super(key: key);

  @override
  State<RoundedFieldPassword> createState() => _RoundedFieldPasswordState();
}

class _RoundedFieldPasswordState extends State<RoundedFieldPassword> {
  bool hiddenPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          obscureText: hiddenPassword,
          onChanged: widget.onchanged,
          decoration: InputDecoration(
              hintText: "Password",
              border: InputBorder.none,
              icon: Icon(
                Icons.lock,
                color: KPrimaryColor,
              ),
              suffixIcon: IconButton(
                icon: Icon(hiddenPassword?Icons.visibility:Icons.visibility_off),
                color: KPrimaryColor,
                onPressed: () {
                  setState(() {
                    hiddenPassword = !hiddenPassword;
                  });
                },
              )),
        ));
  }
}