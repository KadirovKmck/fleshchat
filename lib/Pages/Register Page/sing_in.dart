import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fleshchat/Pages/Register%20Page/registerPages.dart';
import 'package:fleshchat/Pages/sing%20up/sing_up.dart';
import 'package:flutter/material.dart';

class FerstPage extends StatefulWidget {
  const FerstPage({super.key});

  @override
  State<FerstPage> createState() => _FerstPageState();
}

class _FerstPageState extends State<FerstPage> {
  final sizedBox = SizedBox(
    height: 30,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 50.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('⚡ Flesh Chat'),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          sizedBox,
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogIn()));
            },
            child: Container(
                width: 345,
                height: 59,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))),
          ),
          sizedBox,
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Container(
                width: 345,
                height: 59,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                    child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))),
          )
        ],
      ),
    );
  }
}
