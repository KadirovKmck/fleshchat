import 'package:fleshchat/app/Pages/homePage/FirstPage.dart';
import 'package:fleshchat/app/Pages/widgets/drover.dart';
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);
  static const String route = 'HomePage';

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          drawer: Drover(),
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
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, FerstPage.route);
                },
                icon: Icon(Icons.exit_to_app_sharp),
              ),
            ],
            title: Center(
              child: Text(
                'Flesh Chat ⚡',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: TabBarView(children: [
            Center(
              child: Text(
                '⚡Cahts',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                '⚡Status',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                '⚡Calls',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
