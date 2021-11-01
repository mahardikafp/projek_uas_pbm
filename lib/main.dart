import 'package:flutter/material.dart';
import 'package:projek_uas/pages/count.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:projek_uas/pages/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

var jus30;
Future<void> getjus30() async {
  final String response = await rootBundle.loadString("assets/juz30.json");
  final data = await json.decode(response);
  jus30 = data['data'];
}

var isiSurat;
Future<void> getSurat(int idSurah) async {
  final String response = await rootBundle
      .loadString('assets/Surat/' + idSurah.toString() + '.json');
  final data = await json.decode(response);
  isiSurat = data;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/home': (BuildContext ctx) => HomeScreen(),
        '/count': (BuildContext ctx) => Count(),
        // '/detail': (BuildContext ctx) => DetailSurat(),
      },
    );
  }
}
