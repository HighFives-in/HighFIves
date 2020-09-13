import 'package:flutter/material.dart';

//By default font is Montserrat as defined fontfamily inside these themes

const customFontFamily = "Montserrat";

final DARKTHEME = ThemeData(
  // primarySwatch: Colors.white,
  primaryColor: const Color(0xFF141414),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: const Color(0xFFffffff),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.orange,
  fontFamily: customFontFamily,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 50,
        fontFamily: customFontFamily,
        letterSpacing: 0.64,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
      fontSize: 44,
      fontFamily: customFontFamily,
      letterSpacing: 0.64,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
        fontSize: 20,
        fontFamily: customFontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 0.64),
    headline4: TextStyle(
        fontSize: 15,
        fontFamily: customFontFamily,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0.64),
    headline5: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    headline6: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    bodyText1: TextStyle(fontSize: 10, fontFamily: customFontFamily),
    bodyText2: TextStyle(fontSize: 15, fontFamily: customFontFamily),
  ),
);

final LIGHTTHEME = ThemeData(
  // primarySwatch: Colors.black,
  primaryColor: const Color(0xFFffffff),
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: const Color(0xFF141414),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.orange,
  fontFamily: customFontFamily,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 50,
        fontFamily: customFontFamily,
        letterSpacing: 0.64,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
      fontSize: 44,
      fontFamily: customFontFamily,
      letterSpacing: 0.64,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
        fontSize: 20,
        fontFamily: customFontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 0.64),
    headline4: TextStyle(
        fontSize: 15,
        fontFamily: customFontFamily,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        letterSpacing: 0.64),
    //opposite
    headline5: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    headline6: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    bodyText1: TextStyle(fontSize: 20, fontFamily: customFontFamily),
    bodyText2: TextStyle(fontSize: 15, fontFamily: customFontFamily),
  ),
);

// USE LIKE

/*

  Text(
  'example',
  style: TextStyle(fontFamily: 'RobotoMono'),
  );  


  //Weight is defined in assets so can use styles like this
  new TextStyle(
    fontSize: 24.0, 
    fontWeight: FontWeight.w600  // semi-bold
  );

*/
