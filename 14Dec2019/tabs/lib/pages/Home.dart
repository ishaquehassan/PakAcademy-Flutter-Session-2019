import 'package:flutter/material.dart';
import 'package:tabs/Utils.dart';
import 'package:tabs/pages/Tabs.dart';
import 'package:tabs/pages/input_screen.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text;
  String text2;

  @override
  void initState() {
    text = "Hello";
    text2 = "world";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("$text $text2"),
            RaisedButton(
              child: Text('Home'),
              onPressed: (){
                navigate(context,InputScreen(text,onText));
              },
            ),
            RaisedButton(
              child: Text("Tabs"),
              onPressed: (){
                navigate(context,Tabs());
              },
            )
          ],
        ),
      ),
    );
  }

  onText(String text,String password){
    setState(() {
      this.text = text;
      this.text2 = password;
    });
  }
}