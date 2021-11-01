import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projek_uas/main.dart';
import 'package:projek_uas/pages/yasin.dart';
import 'count.dart';
import 'detail.dart';

int mainCounter = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              title: Text('Projek'),
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
                      tooltip: 'Increment',
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
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DetailSurat(
                                  jus30[i]['id'], jus30[i]['surat_name']);
                            }));
                          },
                          title: Text(
                            jus30[i]["surat_name"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text(
                              jus30[i]["id"].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          subtitle: Text(jus30[i]["surat_text"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15)),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            radius: 60,
                            child: Text(
                                jus30[i]["count_ayat"].toString() + ' ayat',
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                    ],
                  )
                //   ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                //   color: Colors.blue,
                //   width: double.infinity,
                //   height: 400,
                //   child: Text(jus30[0]['surat_text'].toString()),
                // ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 15),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.other_houses, size: 15),
                    label: 'Dzikir Counter',
                  ),
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
                    title: Text('Item 3'),
                    onTap: () {
                      Navigator.pop(context);
                    },
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
