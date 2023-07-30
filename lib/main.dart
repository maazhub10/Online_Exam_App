import 'package:flutter/material.dart';
import 'package:online_examination/Screens/SignUp/singup.dart';
import 'package:online_examination/Screens/TestsScreen/MainScreen.dart';
import 'package:online_examination/Screens/welcome/welcome.dart';
import 'package:online_examination/Services/LoginService.dart';
import 'package:online_examination/components/MainScreen/TestCard.dart';
import 'package:online_examination/constraints.dart';
import 'package:flutter/services.dart';
import 'package:online_examination/models/Test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Examination Project',
      theme: ThemeData(
          primaryColor: KPrimaryColor, scaffoldBackgroundColor: Colors.white
      ),
      home: const WelcomeScreen(),

    );
  }
}