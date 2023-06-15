import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleshchat/Pages/homePage/home_pages.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  static const String route = 'SingUp';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Future<void> sinUpPhon() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  final sizedBox = SizedBox(
    height: 30,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Log In ⚡ Flesh Chat',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                backgroundColor: Colors.blue)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              cursorHeight: 45,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'enter your number ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 4)),
                  labelText: 'enter your number',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          sizedBox,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, HomePages.route);
            },
            child: Container(
                width: 360,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  'Log In ⚡',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))),
          ),
        ],
      ),
    );
  }
}
