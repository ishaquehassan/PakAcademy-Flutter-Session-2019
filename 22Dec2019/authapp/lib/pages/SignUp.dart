import 'package:authapp/pages/Dashboard.dart';
import 'package:authapp/pages/LoadingConatiner.dart';
import 'package:authapp/pages/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();

  TextEditingController passCtrl = TextEditingController();

  TextEditingController cpassCtrl = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isLoading;

  String error;

  @override
  void initState() {
    isLoading = false;
    error = "";
    super.initState();

    checkUser();
  }

  checkUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Dashboard(user)));
    }
  }

  signUp() async {
    try {
      setState(() {
        isLoading = true;
        error = "";
      });
      var auth = FirebaseAuth.instance;

      //Creating user profile on firebase
      var response = await auth.createUserWithEmailAndPassword(
          email: emailCtrl.text, password: passCtrl.text);

      //Get the created user
      FirebaseUser u = response.user;

      //Build profile update request
      var infoUpdate = UserUpdateInfo();
      infoUpdate.displayName = nameCtrl.text;

      //Update profile now!
      await u.updateProfile(infoUpdate);

      FirebaseUser realtimeUser = await auth.currentUser();
      print(realtimeUser.displayName);
      checkUser();
    } catch (e) {
      print(e);
      error = "There was a problem while creating your accounts";
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
          title: Text('SignUp'),
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
                      "Sign Up",
                      style: TextStyle(fontSize: 25),
                    ),
                    error.isNotEmpty ? Text(error) : SizedBox(),
                    TextFormField(
                      controller: nameCtrl,
                      validator: (value) {
                        if (value.length < 3) {
                          return "Please enter FUll Name";
                        }
                        if (!value.contains(" ")) {
                          return "Plase enter a valid full name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Full Name"),
                    ),
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
                    TextFormField(
                      controller: cpassCtrl,
                      validator: (value) {
                        if (passCtrl.text != value) {
                          return "Password must be same as confirm password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Confirm Password"),
                    ),
                    RaisedButton(
                      child: Text("SIGN UP"),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          signUp();
                        }
                      },
                    ),
                    Text("OR"),
                    RaisedButton(
                      child: Text("SIGN IN"),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => SignIn()));
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
