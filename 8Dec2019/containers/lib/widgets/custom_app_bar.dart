import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;


  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(title,style: TextStyle(color: Colors.white,fontSize: 30)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
