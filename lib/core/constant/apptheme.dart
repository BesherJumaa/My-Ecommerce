// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    foregroundColor: AppColor.white,
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColor.primaryColor,
    fillColor: AppColor.primaryColor,
  )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColor.white,
    elevation: 5,
    selectedItemColor: AppColor.primaryColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColor.white,
      // elevation: 5,
      // shadowColor: AppColor.primaryColor,
      shape: CircularNotchedRectangle()),
  scaffoldBackgroundColor: AppColor.backGroundColor,
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.primaryColor,
    textTheme: ButtonTextTheme.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
  primaryColor: AppColor.primaryColor,
  dialogBackgroundColor: AppColor.backGroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: AppColor.thirdColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ),
  fontFamily: "Lato",
  textTheme: const TextTheme(
    // bodyText2: TextStyle(color: AppColor.white),
    labelLarge: TextStyle(color: AppColor.white),

    displayLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    displaySmall: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyLarge: TextStyle(height: 1.8, color: AppColor.gray),
    displayMedium: TextStyle(fontWeight: FontWeight.bold),
  ),
  colorScheme:
      ColorScheme.fromSwatch(primarySwatch: AppColor.primarymaterialcolor)
          .copyWith(background: AppColor.backGroundColor),
);

ThemeData themeArabic = ThemeData(
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    foregroundColor: AppColor.white,
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme:
          InputDecorationTheme(focusColor: AppColor.primaryColor)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColor.white,
    elevation: 5,
    selectedItemColor: AppColor.primaryColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColor.white,
      elevation: 5,
      shadowColor: AppColor.primaryColor,
      shape: CircularNotchedRectangle()),
  scaffoldBackgroundColor: AppColor.backGroundColor,
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.primaryColor,
    textTheme: ButtonTextTheme.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
  primaryColor: AppColor.primaryColor,
  dialogBackgroundColor: AppColor.backGroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: AppColor.thirdColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: AppColor.white),
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    displaySmall: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyLarge: TextStyle(height: 1.8, color: AppColor.gray),
    displayMedium: TextStyle(fontWeight: FontWeight.bold),
  ),
  colorScheme:
      ColorScheme.fromSwatch(primarySwatch: AppColor.primarymaterialcolor)
          .copyWith(background: AppColor.backGroundColor),
);
