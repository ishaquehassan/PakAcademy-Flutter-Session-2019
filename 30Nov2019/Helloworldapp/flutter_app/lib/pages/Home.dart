import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body:ListView(
        children: <Widget>[
          item(),
          item(),
          item(),
          item(),
        ],
      ),
    );
  }


  Widget item(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow()
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("images/image.png"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 37.5,
                backgroundImage: AssetImage("images/burger.jpg"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Flutter UI Tutorial",style: TextStyle(
                      fontSize: 20,
                    )),
                    Text("Burger From Pakistan . 32k views ",style: TextStyle(
                      fontSize: 15,
                    ),overflow: TextOverflow.clip,softWrap: true)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}