import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasedb/models/Contact.dart';
import 'package:firebasedb/pages/ListData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnFileDone(StorageReference storageReference);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();

  File image;

  uploadImage(String key, OnFileDone onDone) {
    FirebaseStorage.instance
        .ref()
        .child(key + ".jpg")
        .putFile(image)
        .events
        .listen((event) {
      if (event.type == StorageTaskEventType.success) {
        onDone(event.snapshot.ref);
      } else if (event.type == StorageTaskEventType.failure) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Fail hogya"),
        ));
      }
    });
  }

  saveData() {
    String name = nameCtrl.text;
    String email = emailCtrl.text;

    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("contacts");
    var key = reference.push().key;
    DatabaseReference newContact = reference.child(key);
    var contact = Contact(name, email);
    uploadImage(key, (fileRef) {
      fileRef.getDownloadURL().then((uri) {
        contact.image = uri.toString();
        newContact.set(contact.toJson());
      });
    });
  }

  getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              image != null ? Image.file(image, width: 100) : SizedBox(),
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(hintText: "Email"),
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Select Image"),
                    onPressed: () {
                      getImage();
                    },
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  RaisedButton(
                    child: Text("SAVE TO DB"),
                    onPressed: saveData,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  RaisedButton(
                    child: Text("LIST DATA"),
                    onPressed: () {
                      Navigator.of(context).push(
                          CupertinoPageRoute(builder: (ctx) => ListData()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
