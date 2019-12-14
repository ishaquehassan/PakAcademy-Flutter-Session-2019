import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  Color c;

  @override
  void initState() {
    c = Colors.red;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: c,
      child: Center(
        child: RaisedButton(
          child: Text("Change"),
          onPressed: onChange,
        ),
      ),
    );
  }

  onChange(){
    setState(() {
      if(c == Colors.red){
        c = Colors.lightGreen;
      }else{
        c = Colors.red;
      }
    });
  }
}
