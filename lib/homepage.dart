// import 'dart:js';
import 'package:provider/provider.dart';
import 'package:final_project/ABook.dart';
import 'package:final_project/ABookList.dart';
import 'package:final_project/models/ABookModel.dart';
import 'package:final_project/services/ABookModelService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('App Book'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100.0,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.add_box_outlined),
                  Text('Thêm sách'),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/add');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.logout_outlined),
                  Text('Đăng xuất'),
                ],
              ),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/login');
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: context.read<ABookModelService>().fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ABookList(
              aBookModels: (snapshot.data as List<ABookModel>)
                  .where((element) =>
                      element.option ==
                      (_selectedIndex == 0 ? "Kinh dị" : "Trinh thám"))
                  .toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_reaction_rounded),
            label: 'Kinh dị',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_reaction_outlined), label: 'Trinh thám')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
