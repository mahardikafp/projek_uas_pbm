import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class Yasin extends StatefulWidget {
  const Yasin({Key? key}) : super(key: key);

  @override
  _YasinState createState() => _YasinState();
}

class _YasinState extends State<Yasin> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getyasin(),
        builder: (context, data) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Yā Sīn'),
            ),
            body: ListView(
              children: [
                for (var i = 0; i < yasin.length; i++)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            yasin[i]['aya_text'].toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 40),
                          ),
                          CircleAvatar(
                            radius: 15,
                            foregroundColor: Colors.black,
                            child: Text(
                              yasin[i]['aya_number'].toString(),
                              style: GoogleFonts.lalezar(
                                  textStyle: TextStyle(color: Colors.red)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
