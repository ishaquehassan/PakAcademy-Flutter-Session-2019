import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final FirebaseUser user;

  Dashboard(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Welcome ${user.displayName}', style: TextStyle(fontSize: 17)),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
