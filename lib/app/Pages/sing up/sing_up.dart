import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  static const String route = 'SingUp';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final sizedBox = SizedBox(
    height: 30,
  );
  void singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

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
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                cursorHeight: 45,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Emter your email ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 4)),
                    labelText: 'Emter your email ',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Email";
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                cursorHeight: 45,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Emter your Password ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 4)),
                    labelText: 'Emter your Password ',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
                validator: (value) {
                  if (passwordController.text.length < 6) {
                    return "Your password is slow";
                  }
                  return null;
                },
              ),
            ),
            sizedBox,
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  singIn();
                  Navigator.pushNamed(context, LogIn.route);
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
                    'Log In ⚡',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
