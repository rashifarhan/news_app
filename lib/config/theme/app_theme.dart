import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.withOpacity(0.99),
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme  appBarTheme(){
  return AppBarTheme(
    color: Colors.blueGrey.withOpacity(0.9),
    elevation: 0,
    centerTitle: true,
  

  );
}