import 'package:appspector/appspector.dart';
import 'package:flutter/material.dart';
import 'package:sharedprefs/App.dart';

void main() {
  runApp(App());
  runAppSpector();
}

void runAppSpector() {
  var config = new Config();
  config.androidApiKey =
      "android_ODM3NmYzODYtNThmMC00M2U3LThkNmEtYTNmNDcwZDEzZTY4";
  AppSpectorPlugin.run(config);
}
