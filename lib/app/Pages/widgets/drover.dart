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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
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
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/564x/cb/52/fb/cb52fbfdeee3137d838596dd7aa3b289.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/564x/ee/4f/38/ee4f382084755780ed49302986254344.jpg"),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("About"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.grid_3x3_outlined),
            title: Text("Products"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
