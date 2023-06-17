import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleshchat/app/Pages/homePage/FirstPage.dart';
import 'package:fleshchat/app/Pages/homePage/home_pages.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  static const String route = 'auth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomePages();
          }
          // user not logged in
          else {
            return const FerstPage();
          }
        },
      ),
    );
  }
}
