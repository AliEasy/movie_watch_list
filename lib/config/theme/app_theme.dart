import 'package:flutter/material.dart';
import 'package:movie_watch_list/config/color/app_color.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: backgroundColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: black,
      fontFamily: 'Muli',
      fontSize: 22,
    ),
  );
}
