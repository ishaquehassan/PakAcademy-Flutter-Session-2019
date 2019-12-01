
import 'package:flutter/material.dart';

navigate(BuildContext context,Widget page){
  var nav = Navigator.of(context);
  var route = MaterialPageRoute(builder:(context) => page);
  nav.push(route);
}