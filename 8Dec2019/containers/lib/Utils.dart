import 'dart:async';

import 'package:flutter/material.dart';

navigateClearStack(BuildContext context,Widget route){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => route),
      ModalRoute.withName("/ROOT")
  );
}

setTimeoutMs(void callback(Timer timer),int time){
  Timer timer;
  timer = Timer(Duration(milliseconds: time), (){
    callback(timer);
  });
}