import 'package:flutter/material.dart';

sealed class MyAppThemeSed {
  const MyAppThemeSed._();

  static ThemeData themeData = ThemeData(
    fontFamily: 'RobotoMono',
    primaryColor: Colors.amber,
  ); 
}