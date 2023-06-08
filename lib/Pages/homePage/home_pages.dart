import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Chats ',
              ),
              Tab(
                text: 'Status',
              ),
              Tab(
                text: 'Calls 📞',
              ),
            ]),
            title: Center(
              child: Text(
                'Flesh Chat ⚡',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
