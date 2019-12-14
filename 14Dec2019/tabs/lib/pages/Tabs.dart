import 'package:flutter/material.dart';
import 'package:tabs/pages/tabs/tab1.dart';
import 'package:tabs/pages/tabs/tab2.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs'),
          bottom: TabBar(
            tabs: <Widget>[
              aTab("Tab1"),
              aTab("Tab2"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Tab1(),
            Tab2()
          ],
        ),
      ),
    );
  }

  Tab aTab(String text) => Tab(child: Text(text,style: TextStyle(color: Colors.white)));


}