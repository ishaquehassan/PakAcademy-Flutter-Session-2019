import 'package:containers/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EdgeInsetsGeometry margin;

  @override
  void initState() {
    super.initState();
    margin = EdgeInsets.only(top:20,left:20,right:20,bottom:20);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Hello"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              margin: margin,
              decoration: BoxDecoration(
                  color: Colors.red
              ),
              width: 100,
              height: 100,
            ),
            Positioned(
              bottom: 0,
              child: RaisedButton(
                child: Text("Move it!"),
                onPressed: (){
                  setState(() {
                    margin = EdgeInsets.only(top:150,left:150,right:20,bottom:20);
                    setTimeoutMs((t){
                      setState(() {
                        margin = EdgeInsets.only(top:40,left:40,right:20,bottom:20);
                      });
                    },1000);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget list(){
    return ListView(
      children: <Widget>[
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              test(),
              test(),
              test(),
              test(),
            ],
          ),
        ),
        test(),
        test(),
        test(),
        test(),
        test(),
        test(),
      ],
    );
  }

  Widget test(){
    return SizedBox(
      width: 200,
      height: 200,
      child: Row(
        children: <Widget>[
          Expanded(
            child:Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              height: 200,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello"),
                  Text("world")
                ],
              ),
            ),
          ),
          Expanded(
            child:Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: 200,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}