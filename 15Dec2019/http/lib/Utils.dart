import 'package:flutter/material.dart';

navigate(BuildContext context,Widget route){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}