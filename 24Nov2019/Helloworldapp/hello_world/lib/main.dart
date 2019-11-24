import 'package:flutter/material.dart';
import 'package:hello_world/Home.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
    );
  }

}

