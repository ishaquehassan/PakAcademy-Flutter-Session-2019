import 'dart:async';

import 'package:flutter/material.dart';

import '../Utils.dart';
import 'Dashboard.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var display = MediaQuery.of(context).size;
    Timer t = Timer(Duration(milliseconds: 2000),(){
      navigateClearStack(context,Dashboard());
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child:Image.asset("assets/logo.png",width: display.width-150,height: 200,fit:BoxFit.contain),
          ),
          Positioned(
            bottom: 150,
            child: SizedBox(
              width: display.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }

}