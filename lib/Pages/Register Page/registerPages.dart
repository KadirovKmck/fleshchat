import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController Controller = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerApp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {}
  }

  final sizedBox = SizedBox(
    height: 30,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Register in ⚡ Flesh Chat',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                backgroundColor: Colors.blue)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              cursorHeight: 45,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'enter your name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 4)),
                  labelText: 'enter your name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: emailController,
              cursorHeight: 45,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'enter your email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 4)),
                  labelText: 'enter your email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: passwordController,
              cursorHeight: 45,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'enter your password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 4)),
                  labelText: 'enter your password',
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
              registerApp();
            },
            child: Container(
                width: 360,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  '⚡ Register',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))),
          ),
        ],
      ),
    );
  }
}
