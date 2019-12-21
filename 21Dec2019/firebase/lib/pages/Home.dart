import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailCtrl;
  TextEditingController passwordCtrl;

  @override
  void initState() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.initState();
  }

  signIn() {
    String email = emailCtrl.text;
    String password = passwordCtrl.text;

    var auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      if (res.user == null) {
        print("SignUp failed");
      }
      print(res.user.uid);
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Login"),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(hintText: "Password"),
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: signIn,
            )
          ],
        ),
      ),
    );
  }
}
