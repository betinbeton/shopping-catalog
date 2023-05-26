import 'package:flutter/material.dart';

class Apptheme {
  //!Text
  static const String fontName = 'inter';
  static const FontWeight fontNormal = FontWeight.normal;
  static const FontWeight fontMedium = FontWeight.w500;
  static const FontWeight fontBold = FontWeight.w700;

  //!UI color
  static const Color colorbackground = Color(0xfffafafa);
  static const Color colorPrimary = Color(0xff090a0a);
  static  Color colorSecondary = Colors.amber.withOpacity(0.5);
   static const Color colorError = Colors.red;

  //!AppBar
  static const double appBarFontSize = 18;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: fontName,
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: fontName,
        ),
  );
  //!Text Style
  //*Bold title - Example welcome back
  static const textBoldTitleStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
  static const textBoldTitleStyleLarge = TextStyle(fontSize: 19, fontWeight: FontWeight.w500);
  //*Subtitle - example otras opciones login
  static const textBoldMediumSubTitleStyle = TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: colorPrimary);
  static final textBoldMediumSubTitleStleColorSecondary = TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: colorSecondary);
  static const textBoldMediumSubTitleStyleWhite = TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: colorbackground);
  //*Medium subtitle -Exameple login in to continue
  static const textNormalStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.normal);
  static const textDescriptionlStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  //*Label less llamative - example Recordarme login
  static const textSmall1Style = TextStyle(fontSize: 13, fontWeight: FontWeight.normal);
  static const textSmall1ErrorStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: colorError);

  //*Underline text - example olive mi contrasenia
  // static const textSmall2Style = TextStyle(color: Apptheme.colorSubTitle, fontWeight: FontWeight.bold);
}
