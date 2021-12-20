import 'package:flutter/material.dart';
import 'home_screen.dart';

class Count extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(100),
        ),
        Text(
          "You have dzikir for this many times: ",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w800, fontSize: 15),
        ),
        Text(
          mainCounter.toString(),
          style: Theme.of(context).textTheme.display1,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              mainCounter = 0;
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 30,
            child: Text(
              "Reset",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
