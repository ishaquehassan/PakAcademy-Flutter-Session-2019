import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String title;
  Function onClick;


  MyButton(this.title, this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Text(title,style: TextStyle(color: Colors.white,fontSize: 23)),
      ),
      onTap: onClick,
    );
  }

}