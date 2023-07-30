
import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  const SignUpBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              width: size.width * 0.35,
              child: Image.asset("assets/images/signup_top.png")),
          Positioned(
              width: size.width * 0.25,
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png")),
          child,
        ],
      ),
    );
  }
}