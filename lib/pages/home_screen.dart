import 'dart:convert';
import 'package:flutter/material.dart';
import 'count.dart';

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
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text('Projek'),
        backgroundColor: Colors.purple,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          Container(
            child: FutureBuilder(
              builder: (context, snapshot) {
                var showData = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(showData[index]['surat_name']),
                      subtitle: Text(showData[index]['surat_terjemahan']),
                    );
                  },
                  itemCount: showData.length,
                );
              },
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/juz30.json'),
            ),
          ),
          if (_selectedIndex == 1)
            Count()
          else if (_selectedIndex == 0)
            Container()
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
              title: Text(
                'Item 1',
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.pop(context);
                ;
              },
            ),
            ListTile(
              title: Text('Item 2'),
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
  }
}
