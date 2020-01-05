import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orm/daos/contact_dao.dart';
import 'package:flutter_orm/entities/contact.dart';

import '../database.dart';

final migration1to2 = Migration(1, 2, (database) {
  database.execute('ALTER TABLE Contact ADD COLUMN company TEXT');
});

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();

  TextEditingController companyCtrl = TextEditingController();

  List<Contact> contacts;

  Contact updateAbleContact;

  AppDatabase db;
  ContactDao dao;

  @override
  void initState() {
    contacts = [];
    super.initState();
    $FloorAppDatabase
        .databaseBuilder('helloworld.db')
        .addMigrations([migration1to2])
        .build()
        .then((myDb) {
          db = myDb;
          dao = db.contactDao;
          loadData();
        });
  }

  loadData() async {
    List<Contact> data = await dao.getAll();
    setState(() {
      contacts = data;
    });
  }

  save() async {
    if (updateAbleContact != null) {
      updateInDb();
      return;
    }
    final entity = Contact(
        null, nameCtrl.text, emailCtrl.text, phoneCtrl.text, companyCtrl.text);
    await dao.insertContact(entity);
    clearFields();
    loadData();
  }

  setUpdateView(int index) {
    setState(() {
      updateAbleContact = contacts[index];
      nameCtrl.text = updateAbleContact.name;
      emailCtrl.text = updateAbleContact.email;
      phoneCtrl.text = updateAbleContact.phone;
      companyCtrl.text = updateAbleContact.company;
    });
  }

  updateInDb() async {
    updateAbleContact.name = nameCtrl.text;
    updateAbleContact.email = emailCtrl.text;
    updateAbleContact.phone = phoneCtrl.text;
    updateAbleContact.company = companyCtrl.text;
    await dao.updateContact(updateAbleContact);
    clearFields();
    loadData();
  }

  clearFields() {
    setState(() {
      updateAbleContact = null;
    });
    nameCtrl.clear();
    emailCtrl.clear();
    phoneCtrl.clear();
    companyCtrl.clear();
  }

  deleteContact(idx) async {
    await dao.deleteContact(contacts[idx]);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLITE ORM'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                controller: phoneCtrl,
                decoration: InputDecoration(hintText: "Phone"),
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: companyCtrl,
                decoration: InputDecoration(hintText: "Company"),
              ),
              RaisedButton(
                child: Text(updateAbleContact != null ? "UPDATE" : "SAVE"),
                onPressed: save,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (ctx, idx) => ListTile(
                    title: Text(contacts[idx].name),
                    subtitle: Text(contacts[idx].company),
                    onTap: () {
                      setUpdateView(idx);
                    },
                    onLongPress: () {
                      deleteContact(idx);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
