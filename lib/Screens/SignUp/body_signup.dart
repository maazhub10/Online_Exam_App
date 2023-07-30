import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_examination/Repositories/SignupRepository.dart';
import 'package:online_examination/Screens/login/login.dart';
import 'package:online_examination/components/ErroTextWidget.dart';
import 'package:online_examination/components/RoundedButton.dart';
import 'package:online_examination/components/already_have_an_account_check.dart';
import 'package:online_examination/components/rounded_input_field.dart';
import 'package:online_examination/components/rounded_password_field.dart';
import 'package:online_examination/models/User.dart';

import 'background_signup.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user = User();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = User();
    signUpRepository = new SignUpRepository();
  }

  SignUpRepository? signUpRepository;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SingUp",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            RoundedInputField(
                hintText: "Username",
                onChanged: (value) {
                  user.username = value;
                }),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            RoundedFieldPassword(onchanged: (value) {
              user.password = value;
            }),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            ErroTextWidget(errorMessage: errorMessage),
            RoundedButton(
                text: "SIGNUP",
                press: () {
                  signUpRepository?.Signup(user)
                      .then((value) => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }))
                  })
                      .catchError((onError) {
                    setState(() {
                      errorMessage = onError.toString().substring(11);
                    });
                    print(onError.toString());
                  });
                }),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 40)),
          ],
        ));
  }
}