import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projek_uas/main.dart';
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
    // print(index);
    setState(() {
      _selectedIndex = index;
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
                      onSubmitted: (value) {
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
                        (jus30[i]['surat_name'].toString())
                                .contains(searchSeasion)
                            ? ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return DetailSurat(
                                        jus30[i]['id'], jus30[i]['surat_name']);
                                  }));
                                },
                                title: Text(
                                  jus30[i]["surat_name"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(
                                    jus30[i]["id"].toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                subtitle: Text(
                                    jus30[i]["surat_text"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15)),
                                trailing: CircleAvatar(
                                  backgroundColor: Colors.lightBlue,
                                  radius: 24,
                                  child: Text(
                                      jus30[i]["count_ayat"].toString() +
                                          ' ayat',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.3)),
                                ),
                              )
                            : Container()
                    ],
                  )
              ],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.green,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 20),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.other_houses, size: 20),
                    label: 'Dzikir Counter',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.search_rounded, size: 20),
                  //   label: 'search',
                  // ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        image: DecorationImage(
                            image: AssetImage("images/juzAmma.png"),
                            fit: BoxFit.cover)),
                    child: Text(''),
                  ),
                  ListTile(
                    title: Text('Yā Sīn'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Item 3'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Item 4'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
