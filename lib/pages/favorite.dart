import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'detail.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyApp();
                  }));
                },
                icon: Icon(Icons.arrow_back)),
            Text('Surat favorite'),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              for (int i = 0; i < jus30.length; i++)
                ((jus30[i]['surat_name'].toString()).contains(searchSeasion) &&
                        favorite.contains(jus30[i]["id"].toString()))
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DetailSurat(
                                jus30[i]['id'], jus30[i]['surat_name']);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Text(
                                      jus30[i]["id"].toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        jus30[i]["surat_name"].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                      Text(jus30[i]["surat_text"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  FavoriteButton(
                                    isFavorite: favorite
                                            .contains(jus30[i]["id"].toString())
                                        ? true
                                        : false,
                                    valueChanged: (_isFavorite) {
                                      setState(() {
                                        setData(jus30[i]["id"].toString());
                                      });
                                    },
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.lightBlue,
                                    radius: 24,
                                    child: Text(
                                        jus30[i]["count_ayat"].toString() +
                                            ' ayat',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.3)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(),
            ],
          )
        ],
      ),
    );
  }
}
