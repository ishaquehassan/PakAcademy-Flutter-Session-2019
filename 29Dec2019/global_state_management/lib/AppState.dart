import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppState extends Model {
  Brightness appBrightness = Brightness.light;
  List<String> names = [];

  updateBrightness(Brightness brightness) {
    appBrightness = brightness;
    notifyListeners();
  }

  toggleBrightness() {
    if (appBrightness == Brightness.light) {
      appBrightness = Brightness.dark;
    } else {
      appBrightness = Brightness.light;
    }
    notifyListeners();
  }

  addNames(String name) {
    names.add(name);
    notifyListeners();
  }

  removeName(int index) {
    names.removeAt(index);
    notifyListeners();
  }

  static AppState of(BuildContext context, {bool rebuild = false}) {
    return ScopedModel.of<AppState>(context, rebuildOnChange: rebuild);
  }
}
