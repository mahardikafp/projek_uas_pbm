import 'package:flutter/material.dart';
import 'home_screen.dart';

class Count extends StatefulWidget {
  // const Count({Key? key}) : super(key: key);
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
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
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




// class _CountState extends State<Count> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tasbih"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("You have tasbih for this many times: "),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'increment',
//         child: Icon(Icons.add_a_photo_rounded),
//       ),
//     );
//   }
// }
