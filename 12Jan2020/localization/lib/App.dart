import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/pages/Home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //app-specific localization
        EasylocaLizationDelegate(locale: data.locale, path: 'langs'),
      ],
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AE')],
      locale: data.savedLocale,
    );
  }
}
