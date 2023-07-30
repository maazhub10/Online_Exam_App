import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErroTextWidget extends StatelessWidget {
  const ErroTextWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(color: Colors.red),
    );
  }
}