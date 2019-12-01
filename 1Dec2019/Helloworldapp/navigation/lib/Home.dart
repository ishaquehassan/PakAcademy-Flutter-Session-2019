import 'package:flutter/material.dart';
import 'package:navigation/About.dart';
import 'package:navigation/MyButton.dart';

import 'Commons.dart';
import 'MyInputField.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width - 100,
      ),
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RaisedButton(
            child: Text("Goto About"),
            onPressed: () {
              navigate(context, About());
            },
          ),
          MyInputField("Email"),
          MyInputField("Password"),
          MyButton("My About", () {
            navigate(context, About());
          }),
          MyButton("My About", () {
            navigate(context, About());
          })
        ],
      ),
    );
  }
}
