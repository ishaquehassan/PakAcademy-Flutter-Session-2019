import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'LoadingConatiner.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailCtrl = TextEditingController();

  TextEditingController passCtrl = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isLoading;

  String error;

  @override
  void initState() {
    isLoading = false;
    error = "";
    super.initState();
  }

  checkUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Dashboard(user)));
    }
  }

  signIn() async {
    try {
      setState(() {
        isLoading = true;
        error = "";
      });
      var auth = FirebaseAuth.instance;

      //Creating user profile on firebase
      var response = await auth.signInWithEmailAndPassword(
          email: emailCtrl.text, password: passCtrl.text);
      checkUser();
    } catch (e) {
      print(e);
      error = "There was a problem while logging in";
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingConatiner(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sign Ins",
                      style: TextStyle(fontSize: 25),
                    ),
                    error.isNotEmpty ? Text(error) : SizedBox(),
                    TextFormField(
                      controller: emailCtrl,
                      validator: (value) {
                        if (!value.contains("@")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    TextFormField(
                      controller: passCtrl,
                      validator: (value) {
                        if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    RaisedButton(
                      child: Text("SIGN IN"),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          signIn();
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
