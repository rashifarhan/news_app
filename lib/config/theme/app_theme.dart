import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.withOpacity(0.9),
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme  appBarTheme(){
  return AppBarTheme(
    color: Colors.grey.withOpacity(0.7),
    elevation: 0,
    centerTitle: true,
  

  );
}