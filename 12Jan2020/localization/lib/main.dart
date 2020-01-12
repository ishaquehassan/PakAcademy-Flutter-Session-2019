import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'App.dart';

void main() {
  var localizedApp = EasyLocalization(child: App());
  runApp(localizedApp);
}
