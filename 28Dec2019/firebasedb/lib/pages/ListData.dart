import 'package:firebase_database/firebase_database.dart';
import 'package:firebasedb/models/Contact.dart';
import 'package:flutter/material.dart';

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List<Contact> contacts;
  bool isLoaded;

  @override
  void initState() {
    contacts = [];
    isLoaded = false;
    super.initState();
  }

  loadData() {
    var contactsRef = FirebaseDatabase.instance.reference().child("contacts");

    contactsRef.onChildAdded.listen((event) {
      Contact contact =
          Contact.fromJson(Map<String, dynamic>.from(event.snapshot.value));
      setState(() {
        isLoaded = true;
        contacts.add(contact);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      loadData();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ListData'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (ctx, idx) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(contacts[idx].image, width: 50),
                Text(contacts[idx].name),
                Text(contacts[idx].email),
              ],
            ),
          );
        },
      ),
    );
  }
}
