import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController toDoFieldCtrl;
  List<String> toDos;

  @override
  void initState() {
    super.initState();
    toDos = [];
    toDoFieldCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home : No Of Items ${toDos.length}"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: toDoFieldCtrl,
                ),
              ),
              RaisedButton(
                child: Text("Add"),
                onPressed: (){
                  String toDotext = toDoFieldCtrl.text;
                  setState(() {
                    toDos.add(toDotext);
                  });
                  toDoFieldCtrl.clear();
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: toDos.length,
              itemBuilder: (ctx,i){
                return itemView(toDos[i],(){
                  setState(() {
                    toDos.removeAt(i);
                  });
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemView(String toDoText,Function onTap){
    return InkWell(
      child: Container(
        child: Text(toDoText,style: TextStyle(fontSize: 20),),
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow()
            ]
        ),
      ),
      onTap: onTap,
    );
  }

}