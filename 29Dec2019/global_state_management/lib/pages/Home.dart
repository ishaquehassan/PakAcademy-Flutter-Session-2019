import 'package:flutter/material.dart';
import 'package:global_state_management/AppState.dart';
import 'package:global_state_management/pages/ListPage.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (ctx, child, appState) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Home : You have ${appState.names.length} Names'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RaisedButton(
                  child: Text(
                      "Change Theme to : ${appState.appBrightness == Brightness.dark ? "Light" : "Dark"}"),
                  onPressed: () {
                    appState.toggleBrightness();
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                      ),
                    ),
                    RaisedButton(
                      child: Text("Add"),
                      onPressed: () {
                        appState.addNames(controller.text);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => ListPage()));
                      },
                    )
                  ],
                )
              ],
            ));
      },
    );
  }
}
