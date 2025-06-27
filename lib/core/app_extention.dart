import 'package:flutter/material.dart';

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
}
