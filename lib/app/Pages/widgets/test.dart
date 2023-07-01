import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formfield,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Your Name";
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Email";
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return "Enter Valid Email";
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: PasswordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Your Passcord";
                } else if (PasswordController.text.length < 6) {
                  return "Password Length Should be more than 6 characters";
                }
              },
            ),
            InkWell(
              onTap: () {
                if (_formfield.currentState!.validate()) {
                  print('oshibka');
                  nameController.clear();
                  emailController.clear();
                  PasswordController.clear();
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
                    '⚡ Register',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
