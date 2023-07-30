import 'package:flutter/material.dart';
import 'package:online_examination/Screens/TestsScreen/TestsList.dart';
import 'package:online_examination/Screens/TestsScreen/TestsProvider.dart';
import 'package:online_examination/Services/TestService.dart';
import 'package:online_examination/components/MainScreen/RowAllTestsWithButton.dart';
import 'package:online_examination/components/MainScreen/SearchField.dart';
import 'package:online_examination/constraints.dart';
import 'package:online_examination/models/Test.dart';
import 'package:online_examination/models/User.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Test> tests = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Main screen");
    TestsService testsService = new TestsService();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: KPrimaryLightColor,
        body: ChangeNotifierProvider<QuizzProvider>(
          create: (context) {
            QuizzProvider quizzProvider = QuizzProvider();
            quizzProvider.getAllTests();
            return quizzProvider;
          },
          child: Column(
            children: [
              //header with search
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(color: KPrimaryLightColor),
                  child: Consumer<QuizzProvider>(
                    builder: (context, myType, child) {
                      return Stack(
                        children: [
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                children: [
                                  Text(
                                    "Hi " + widget.user.username.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          CircleBorder()),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(10)),
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white), // <-- Button color
                                    ),
                                  )
                                ],
                              )),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Consumer<QuizzProvider>(
                                builder: (context, quizzProvider, child) {
                                  return SearchTextField(onchanged: (value) {
                                    setState(() {
                                      quizzProvider.getTestsbykeyword(value);
                                    });
                                  });
                                },
                              ))
                        ],
                      );
                    },
                  )),
              //header with search

              //all tests and button
              RowAllTestsWithButton(),
              //all tests and button
              ListOfAllTests()
            ],
          ),
        ));
  }
}