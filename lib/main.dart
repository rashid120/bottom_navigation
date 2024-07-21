import 'package:bottom_navigation/chatting_page.dart';
import 'package:bottom_navigation/country_code_picker.dart';
import 'package:bottom_navigation/image_widget.dart';
import 'package:bottom_navigation/reoder_list_view.dart';
import 'package:bottom_navigation/some_widget.dart';
import 'package:flutter/material.dart';

import 'animated_container.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedItem = 0;
  final List _screen = [
    MyListView(),
    const ReoderListView(),
    const SomeWidget(),
    const CountryCodePicker()
  ];

  void _onTappedIndex(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Home Screen"),
          actions: [
            PopupMenuButton(
              elevation: 10,

                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: const Text("Animated container"),
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedContainer2(),));
                      },
                    ),
                    PopupMenuItem(
                        child: const Text("Slider image"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageWidget(),));
                      },
                    )
                  ];
                },
            )
          ],
        ),
        body: _screen[_selectedItem],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          backgroundColor: Colors.blueGrey,
          elevation: 50.0,
          unselectedIconTheme: const IconThemeData(color: Colors.blueGrey),
          unselectedItemColor: Colors.blueGrey,
          selectedIconTheme: const IconThemeData(color: Colors.green),
          currentIndex: _selectedItem,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "List View"),
            BottomNavigationBarItem(icon: Icon(Icons.view_list), label: "ReorderListView"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "List View"),
            BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Country code")
          ],
          onTap: _onTappedIndex,
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey,
          elevation: 80,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Rashid Khan'),
                accountEmail: Text('rashid@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 50,
                  child: FlutterLogo(),
                ),
              ),
              ListTile(
                title: const Text("Account"),
                leading: const Icon(Icons.person),
                onTap: () {},
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChattingPage()));
        }, child: const Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  MyListView({super.key});

  final List _fruitList = [
    "Apple",
    "Mango",
    "Orange",
    "Banana",
    "Papaya",
    "Grape",
    "Water fruit"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          shadowColor: Colors.greenAccent,
          child: ListTile(
            leading: const Icon(Icons.free_breakfast_rounded),
            title: Text(_fruitList[index]),
            trailing: IconButton(
                onPressed: () {
                  _fruitList.removeAt(index);
                },
                icon: const Icon(Icons.delete)),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return ExpansionTile(
          backgroundColor: Colors.blueGrey,
          title: const Text("Description"),
          children: [
            ListTile(
              title: Text("This ${_fruitList[index]} is for you"),
              subtitle: const Text("Have a lot of fun"),
            )
          ],
        );
      },
      itemCount: _fruitList.length,
    );
  }
}
