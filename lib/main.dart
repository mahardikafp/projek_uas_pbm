import 'package:flutter/material.dart';
import 'package:juz__amma/pages/count.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:juz__amma/pages/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> favorite = [];
setData(String idSurah) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!favorite.contains(idSurah)) {
    favorite.add(idSurah);
    prefs.setStringList("favorite", favorite);
  } else {
    favorite.remove(idSurah);
    prefs.setStringList("favorite", favorite);
  }
}

setInit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("favorite", ["79", "81"]);
}

getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  favorite = prefs.getStringList("favorite")!;
  print("favorite =" + favorite.toString());
}

var jus30;
bool isSearching = false;
Future<void> getjus30() async {
  final String response = await rootBundle.loadString("assets/juz30.json");
  final data = await json.decode(response);
  jus30 = data['data'];
}

var yasin;
Future<void> getyasin() async {
  final String response = await rootBundle.loadString("assets/36.json");
  final data = await json.decode(response);
  yasin = data['data'];
}

String searchSeasion = "";

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

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/home': (BuildContext ctx) => HomeScreen(),
        '/count': (BuildContext ctx) => Count(),
      },
    );
  }
}
