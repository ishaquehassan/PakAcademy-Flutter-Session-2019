import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller;
  bool isChecked;
  final String checkedKey = "isChecked";
  final String textkey = "textKey";

  @override
  void initState() {
    isChecked = false;
    controller = TextEditingController();
    super.initState();
    getValue();
  }

  getValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      isChecked = preferences.getBool(checkedKey) ?? false;
      controller.text = preferences.getString(textkey) ?? "";
    });
  }

  storeChecked(bool checked) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(checkedKey, checked);
    setState(() {
      isChecked = checked;
    });
  }

  saveText() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(textkey, controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text("My Checkbox"),
                ),
                Switch(
                  value: isChecked,
                  onChanged: storeChecked,
                )
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller,
                  ),
                ),
                RaisedButton(
                  child: Text("Add"),
                  onPressed: saveText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
