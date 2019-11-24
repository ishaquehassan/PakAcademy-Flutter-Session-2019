import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Hello world"),
      ),
    );
  }

}