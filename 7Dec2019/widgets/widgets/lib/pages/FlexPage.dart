import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text("Logo Here",style: TextStyle(color: Colors.white),)),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text("Logo Here",style: TextStyle(color: Colors.white),)),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            color: Colors.green,
          )
        ],
      ),
    );
  }

}