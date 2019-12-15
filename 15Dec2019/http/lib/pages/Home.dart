import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabs/models/BooksResponse.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Items> books;

  @override
  void initState() {
    books = [];
    super.initState();
  }

  loadBooks(){
    var req = http.get("https://www.googleapis.com/books/v1/volumes?q=flutter");
    req.then((response){
      Map<String,dynamic> data = json.decode(response.body);
      List<dynamic> items = data['items'];

      Map<String,dynamic> item = items[1];
      Map<String,dynamic> volumeInfo = item["volumeInfo"];
      String title = volumeInfo["title"];
      setState(() {
        //responseStr = title;
      });

    }).catchError((e){
      setState(() {
        //responseStr = e.toString();
      });
    });
  }

  loadBooksParsed(){
    var req = http.get("https://www.googleapis.com/books/v1/volumes?q=flutter");
    req.then((response){
      Map<String,dynamic> data = json.decode(response.body);
      BooksResponse booksResponse = BooksResponse.fromJson(data);
      setState(() {
        books = booksResponse.items;
      });

    }).catchError((e){
//      setState(() {
//        responseStr = e.toString();
//      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("GetBooks"),
              onPressed: (){
                loadBooksParsed();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (ctx,index){
                  Items item = books[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Image.network(item.volumeInfo.imageLinks.smallThumbnail,width: 50),
                        Expanded(
                          child: Text(item.volumeInfo.title),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}