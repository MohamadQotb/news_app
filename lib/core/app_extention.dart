import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

extension AppExtention on BuildContext {
  TextTheme getTextStyle() {
    return Theme.of(this).textTheme;
  }

  ThemeData getColor() {
    return Theme.of(this);
  }

  Size getSize() {
    return MediaQuery.sizeOf(this);
  }

  AppLocalizations get loc => AppLocalizations.of(this)!;
}
