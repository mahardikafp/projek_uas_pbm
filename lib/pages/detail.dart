import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_uas/main.dart';

class DetailSurat extends StatefulWidget {
  int idSurat;
  String namaSurat;
  DetailSurat(this.idSurat, this.namaSurat);

  @override
  _DetailSuratState createState() => _DetailSuratState();
}

class _DetailSuratState extends State<DetailSurat> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSurat(widget.idSurat),
      builder: (context, data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.namaSurat),
            backgroundColor: Colors.purple,
          ),
          body: ListView(
            children: [
              for (var i = 0; i < isiSurat['data'].length; i++)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          isiSurat['data'][i]['aya_text'].toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 40),
                        ),
                        CircleAvatar(
                          radius: 15,
                          foregroundColor: Colors.black,
                          child: Text(
                            isiSurat['data'][i]['aya_number'].toString(),
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
      },
    );
  }
}
