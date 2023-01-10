import 'dart:ui';
import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Colors.blue ;
  static Color SearchColor = Colors.grey ;

  static ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: MyTheme.primaryColor ,
    elevation: 0 ,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30)
      )
    )
  ) ,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.blue , fontSize: 20 , fontWeight: FontWeight.bold , fontFamily: "Schyler" ,
      ),
      headline3: TextStyle(color: Colors.white , fontSize: 20 ,fontWeight: FontWeight.bold)

    ) ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white ,
      unselectedItemColor: Colors.black ,
      backgroundColor: Colors.transparent ,
      elevation: 0
    ) ,
    scaffoldBackgroundColor: Colors.white24

  );

}