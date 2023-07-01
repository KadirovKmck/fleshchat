import 'package:fleshchat/app/Pages/Register%20Page/registerPages.dart';
import 'package:fleshchat/app/Pages/homePage/FirstPage.dart';
import 'package:fleshchat/app/Pages/homePage/home_pages.dart';
import 'package:fleshchat/app/Pages/sing%20up/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FleshChat());
}

class FleshChat extends StatelessWidget {
  const FleshChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FerstPage.route,
      routes: {
        RegisterPage.route: (context) => const RegisterPage(),
        LogIn.route: (context) => const LogIn(),
        HomePages.route: (context) => const HomePages(),
        FerstPage.route: (context) => FerstPage(),
      },
      debugShowCheckedModeBanner: false,

      // home: FerstPage(),
      // home: Auth(),
      // home: Test(),
      // home: HomePages(),
    );
  }
}
