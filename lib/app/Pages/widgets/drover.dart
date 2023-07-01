import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fleshchat/app/Pages/Register%20Page/registerPages.dart';
import 'package:fleshchat/app/Pages/homePage/FirstPage.dart';
import 'package:fleshchat/app/Pages/homePage/home_pages.dart';
import 'package:flutter/material.dart';

class Drover extends StatefulWidget {
  const Drover({Key? key}) : super(key: key);

  @override
  _DroverState createState() => _DroverState();
}

class _DroverState extends State<Drover> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text("Kadir"),
          accountEmail: Text("Kadirov@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/564x/ce/cc/bf/ceccbf75b58141b7a1b66bcf77f310ca.jpg"),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/564x/c7/9a/3e/c79a3ef44c4ddc4b424ccccbd3c5fc3a.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(EvaIcons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.pushNamed(context, HomePages.route);
          },
        ),
        ListTile(
          leading: Icon(EvaIcons.people),
          title: Text("Contacts"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(EvaIcons.grid),
          title: Text("Products"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(EvaIcons.settings),
          title: Text("Settings"),
          onTap: () {},
        ),
        SizedBox(
          height: 260,
        ),
        ListTile(
          leading: Icon(EvaIcons.logOut),
          title: Text(
            "log out",
            style: TextStyle(fontSize: 15, color: Colors.red),
          ),
          onTap: () {
            Navigator.pushNamed(context, FerstPage.route);
          },
        )
      ]),
    ));
  }
}
