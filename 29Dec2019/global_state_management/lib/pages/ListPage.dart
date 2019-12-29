import 'package:flutter/material.dart';
import 'package:global_state_management/AppState.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = AppState.of(context, rebuild: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPage'),
      ),
      body: ListView.builder(
        itemCount: appState.names.length,
        itemBuilder: (ctx, idx) {
          return ListTile(
            title: Text(appState.names[idx]),
            onTap: () {
              appState.removeName(idx);
            },
          );
        },
      ),
    );
  }
}
