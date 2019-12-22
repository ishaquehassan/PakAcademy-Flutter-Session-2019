import 'package:flutter/material.dart';

class LoadingConatiner extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  LoadingConatiner({@required this.isLoading, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[child, isLoading ? overLay() : SizedBox()],
    );
  }

  overLay() {
    return Container(
      color: Color(0x80000000),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
