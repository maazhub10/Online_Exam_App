import 'package:flutter/material.dart';
import 'package:online_examination/constraints.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key, required this.onchanged,
  }) : super(key: key);

  final ValueChanged<String> onchanged;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: KPrimaryColor.withOpacity(0.2))
          ]),
      child: TextField(
          onChanged: onchanged,
          decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none)),
    );
  }
}