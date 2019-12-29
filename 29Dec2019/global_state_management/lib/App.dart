import 'package:flutter/material.dart';
import 'package:global_state_management/AppState.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/Home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
      model: AppState(),
      child: MaterialApp(
        home: Home(),
        theme: ThemeData(brightness: Brightness.dark),
      ),
    );
  }
}
