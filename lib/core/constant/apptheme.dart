// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  primarySwatch: AppColor.primarymaterialcolor,
  backgroundColor: AppColor.backGroundColor,
  primaryColor: AppColor.primaryColor,
  dialogBackgroundColor: AppColor.backGroundColor,
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    headline3: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyText1: TextStyle(height: 1.8, color: AppColor.gray),
    headline2: TextStyle(fontWeight: FontWeight.bold),
  ),
);

ThemeData themeArabic = ThemeData(
  backgroundColor: AppColor.backGroundColor,
  primaryColor: AppColor.primaryColor,
  dialogBackgroundColor: AppColor.backGroundColor,
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    headline3: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyText1: TextStyle(height: 1.8, color: AppColor.gray),
    headline2: TextStyle(fontWeight: FontWeight.bold),
  ),
  primarySwatch: AppColor.primarymaterialcolor,
);
