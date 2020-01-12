import 'package:flutter/material.dart';
import 'package:localization/Utils.dart';

class DarwerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(getString(context, "home-text")),
    );
  }
}
