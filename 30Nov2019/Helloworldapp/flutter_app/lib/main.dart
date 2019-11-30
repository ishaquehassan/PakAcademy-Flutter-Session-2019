import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Home.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Color(0xFFFF0000),
      ),
    );
  }

}