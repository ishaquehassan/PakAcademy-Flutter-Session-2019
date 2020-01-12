import 'package:flutter/material.dart';
import 'package:localization/Utils.dart';
import 'package:localization/models/Contact.dart';
import 'package:localization/widgets/DarwerLayout.dart';
import 'package:tinycolor/tinycolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked;

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  List<Contact> getContacts() {
    return [
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
      Contact("Ishaq", "23234344234", "flutter.png"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          TinyColor.fromString(getString(context, "bgColor")).color,
      drawer: Drawer(
        child: DarwerLayout(),
      ),
      appBar: AppBar(
        title: Text(getString(context, "home-text")),
        actions: <Widget>[
          Switch(
            value: isChecked,
            onChanged: (val) {
              setState(() {
                isChecked = val;
                if (isChecked) {
                  changeLanguage(context, Lang.AR);
                } else {
                  changeLanguage(context, Lang.EN);
                }
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: getContacts().length,
        itemBuilder: (c, i) {
          var contact = getContacts()[i];
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Image.asset(
                  getImage(context, contact.image),
                  width: 50,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        contact.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(contact.number),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  getLayout(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(getString(context, "home-text")),
        Image.asset(
          getImage(context, "flutter.png"),
          width: 100,
          height: 100,
        ),
        RaisedButton(
          child: Text(getString(context, "change-lang-button")),
          onPressed: () {
            if (getCurrentLang(context) == Lang.EN) {
              changeLanguage(context, Lang.AR);
            } else {
              changeLanguage(context, Lang.EN);
            }
          },
        )
      ],
    );
  }
}
