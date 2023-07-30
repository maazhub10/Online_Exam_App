import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/material.dart';
import 'package:online_examination/Screens/TestsScreen/TestsProvider.dart';
import 'package:online_examination/Screens/welcome/components/body.dart';
import 'package:online_examination/constraints.dart';
import 'package:online_examination/models/Test.dart';
import 'package:provider/provider.dart';

class TestCard extends StatelessWidget {
  const TestCard(
      {Key? key,
        this.color,
        required this.name,
        required this.code,
        required this.id,
        this.test})
      : super(key: key);

  final Color? color;
  final String name;
  final String code;
  final int id;
  final Test? test;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: kTestCardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.6))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Test : " + name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Spacer(),
              Consumer<QuizzProvider>(
                builder: (context, quizzProvider, child) {
                  return EasyElevatedButton(
                    label: ' pass ',
                    isRounded: true,
                    color: Color(0xFF371B58),
                    onPressed: () {
                      print("name = ${test!.name}");
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                              QuestionsPage(),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              Text(
                "Code : " + code,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryLightColor,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.2,
            child: Text(
              "flutter QCM",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
      ]),
    );
  }
}