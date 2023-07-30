
import 'package:flutter/material.dart';

class RowAllTestsWithButton extends StatelessWidget {
  const RowAllTestsWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: size.height * 0.12,
      child: Row(
        children: [
          Text(
            "All Tests",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                  color: Color.fromARGB(255, 152, 25, 255),
                  onPressed: () {},
                  child: Text(
                    "Add New",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
          )
        ],
      ),
    );
  }

  FlatButton({required Color color, required Null Function() onPressed, required Text child}) {}
}