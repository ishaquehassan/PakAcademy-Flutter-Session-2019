import 'package:flutter/material.dart';

typedef OnText(String text,String password);

class InputScreen extends StatelessWidget {
  TextEditingController controllerUser;
  TextEditingController controllerPass;

  String defaultText;
  OnText onText;
  InputScreen(this.defaultText, this.onText);

  @override
  Widget build(BuildContext context) {
    if(controllerUser == null){
      controllerUser = TextEditingController(text: defaultText);
    }
    if(controllerPass == null){
      controllerPass = TextEditingController();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controllerUser,
              decoration: InputDecoration(
                hintText: "Username"
              ),
            ),
            TextField(
              controller: controllerPass,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            RaisedButton(
              child: Text("DONE"),
              onPressed: (){
                Navigator.of(context).pop();
                onText(controllerUser.text,controllerPass.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
