import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  String label;

  MyInputField(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        children: <Widget>[
          Text("$label : "),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
    );
  }

}