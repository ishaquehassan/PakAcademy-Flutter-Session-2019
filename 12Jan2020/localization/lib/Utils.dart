import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

String getString(BuildContext context, String key) {
  return AppLocalizations.of(context).tr(key);
}

enum Lang { EN, AR }

changeLanguage(BuildContext context, Lang lang) {
  var locale = Locale('ar', 'AE');
  if (lang == Lang.EN) {
    locale = Locale('en', 'US');
  }
  EasyLocalizationProvider.of(context).data.changeLocale(locale);
}

Lang getCurrentLang(BuildContext context) {
  var provider = EasyLocalizationProvider.of(context);
  if (provider.data.locale.languageCode == "ar") {
    return Lang.AR;
  }
  return Lang.EN;
}

String getImage(BuildContext context, String path) {
  String dir = "en";
  if (getCurrentLang(context) == Lang.AR) {
    dir = "ar";
  }
  return "images/$dir/$path";
}
