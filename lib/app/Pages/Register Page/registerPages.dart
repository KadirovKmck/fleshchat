import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleshchat/app/Pages/homePage/home_pages.dart';
import 'package:fleshchat/app/Pages/widgets/contener_login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });
  static const String route = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

// Future<void> addUsers()async{

// }
  final users = FirebaseFirestore.instance.collection('users');
  Future<void> UrModels() {
    return users
        .add({
          'name': nameController.text,
          'email': emailController.text,
          'id': passwordController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    ;
  }

  Future<void> registerApp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => {
                UrModels(),
                nameController.clear(),
                emailController.clear(),
                passwordController.clear(),
                confirmController.clear(),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {}
  }

  bool passwordOff = false;
  bool confirmoff = false;

  final sizedBox = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formfield,
          child: Column(
            children: [
              WidgetContener(
                text: 'Sin Up Flash Chat⚡',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
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
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter your name";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
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
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(EvaIcons.emailOutline)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Enter Valid Email";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: passwordController,
                  cursorHeight: 45,
                  obscureText: passwordOff,
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
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(EvaIcons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passwordOff = !passwordOff;
                        });
                      },
                      child: Icon(passwordOff
                          ? EvaIcons.eyeOffOutline
                          : EvaIcons.eyeOutline),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Passcord";
                    } else if (passwordController.text.length < 6) {
                      return "Password Length Should be more than 6 characters";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: confirmController,
                  cursorHeight: 45,
                  obscureText: confirmoff,
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
                        borderSide: BorderSide(color: Colors.black)),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          confirmoff = !confirmoff;
                        });
                      },
                      child: Icon(confirmoff
                          ? EvaIcons.eyeOffOutline
                          : EvaIcons.eyeOutline),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Confirm Password";
                    } else if (value != passwordController) {
                      return "Password Length Should be more than 6 characters";
                    }
                  },
                ),
              ),
              sizedBox,
              InkWell(
                onTap: () {
                  if (_formfield.currentState!.validate()) {
                    registerApp();
                    Navigator.pushNamed(context, HomePages.route);
                  }
                },
                child: Container(
                    width: 360,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      ' Register⚡',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
