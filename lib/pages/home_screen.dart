import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:juz__amma/main.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:juz__amma/pages/favorite.dart';
import 'package:juz__amma/pages/yasin.dart';
import 'package:juz__amma/pages/favorite.dart';
import 'count.dart';
import 'detail.dart';

int mainCounter = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  Future<void> getjus30() async {
    final String response = await rootBundle.loadString("assets/juz30.json");
    final data = await json.decode(response);
    jus30 = data['data'];
  }
  
  void _getjus30(value) {
    print(value);
  }

  void incrementCounter() {
    setState(() {
      mainCounter++;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _index = 0;

  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getjus30(),
        builder: (context, data) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: !isSearching
                  ? Text('Juz Amma')
                  : TextField(
                      onChanged: (value) {
                        setState(() {
                          searchSeasion = value.toString();
                        });
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          icon: Icon(Icons.search_rounded, color: Colors.white),
                          hintText: "search surat",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
              actions: <Widget>[
                isSearching
                    ? IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            this.isSearching = !this.isSearching;
                            searchSeasion = "";
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search_rounded),
                        onPressed: () {
                          setState(() {
                            this.isSearching = !this.isSearching;
                          });
                        },
                      )
              ],
              backgroundColor: Colors.green,
            ),
            floatingActionButton: _selectedIndex == 1
                ? FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: incrementCounter,
                    tooltip: 'increment',
                    child: Icon(Icons.add),
                  )
                : new Visibility(
                    visible: false,
                    child: new FloatingActionButton(
                      onPressed: () {},
                      tooltip: 'increment',
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: ListView(
              children: [
                if (_selectedIndex == 1)
                  Count()
                else if (_selectedIndex == 0)
                  Column(
                    children: [
                      for (int i = 0; i < jus30.length; i++)
                        (jus30[i]['surat_name'].toString().toLowerCase())
                                .contains(searchSeasion.toLowerCase())
                            ? InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return DetailSurat(
                                        jus30[i]['id'], jus30[i]['surat_name']);
                                  }));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: Text(
                                              jus30[i]["id"].toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                jus30[i]["surat_name"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                  jus30[i]["surat_text"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 15)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          FavoriteButton(
                                            isFavorite: favorite.contains(
                                                    jus30[i]["id"].toString())
                                                ? true
                                                : false,
                                            valueChanged: (_isFavorite) {
                                              setData(
                                                  jus30[i]["id"].toString());
                                            },
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.lightBlue,
                                            radius: 24,
                                            child: Text(
                                                jus30[i]["count_ayat"]
                                                        .toString() +
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
       

            bottomNavigationBar: FloatingNavbar(
              backgroundColor: Colors.green,
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              items: [
                FloatingNavbarItem(icon: Icons.home, title: 'Surah'),
                FloatingNavbarItem(
                    icon: Icons.calculate, title: 'Dzikir Counter'),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                            image: AssetImage("images/juzAmma.png"),
                            fit: BoxFit.cover)),
                    child: Text(''),
                  ),
                  ListTile(
                    title: Text('Yā Sīn'),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Yasin();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Surat Favorite'),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return FavoritePage();
                      }));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
