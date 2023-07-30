


import 'package:flutter/material.dart';
import 'package:online_examination/Screens/TestsScreen/TestsProvider.dart';
import 'package:online_examination/components/MainScreen/TestCard.dart';
import 'package:provider/provider.dart';

class ListOfAllTests extends StatelessWidget {
  const ListOfAllTests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<QuizzProvider>(
      builder: (context, QuizzProvider, child) {
        return Container(
          height: size.height - size.height * 0.25 - size.height * 0.12,
          child: ListView.builder(
            itemCount: QuizzProvider.tests.length,
            itemBuilder: (BuildContext context, int index) {
              return TestCard(
                test: QuizzProvider.tests[index],
                id: QuizzProvider.tests[index].id ??0,
                name: QuizzProvider.tests[index].name ?? "",
                code: QuizzProvider.tests[index].code ?? "",
              );
            },
          ),
        );
      },
    );
  }
}