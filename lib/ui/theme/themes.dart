import 'package:flutter/material.dart';
import 'package:places/ui/theme/color_palette.dart';
import 'package:places/ui/theme/text_themas.dart';

import 'font_collection.dart';

final lightTheme = ThemeData(
  primaryColor: ColorPalette.lmPrimaryColor,
  backgroundColor: ColorPalette.lmPrimaryColor,
  scaffoldBackgroundColor: ColorPalette.lmPrimaryColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    color: ColorPalette.lmCardColor,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: ColorPalette.lmTabBarSelect,
    labelStyle: FontCollection.devHeadline6,
    unselectedLabelColor: ColorPalette.lmTabBarUnSelect,
    unselectedLabelStyle: FontCollection.devHeadline6,
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: ColorPalette.lmTabBarCursor),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorPalette.lmNavigationBarBackground,
    showSelectedLabels: false,
    elevation: 4,
    selectedIconTheme: IconThemeData(color: ColorPalette.greenColor, size: 30),
    unselectedIconTheme:
        IconThemeData(color: ColorPalette.lmBasicColor, size: 30),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorPalette.lmPrimaryColor),
      textStyle: MaterialStateProperty.all(
        FontCollection.devButton
      ),
    ),
  ),
  textTheme: lmTextTheme,
  iconTheme: const IconThemeData(
    color: ColorPalette.lmIcon,
    size: 30,
  ),
);

final darkTheme = ThemeData(
  primaryColor: ColorPalette.dmPrimaryColor,
  backgroundColor: ColorPalette.dmPrimaryColor,
  scaffoldBackgroundColor: ColorPalette.dmPrimaryColor,
  //Тема для аппбара
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
  ),
  //Тема для карточек
  cardTheme: CardTheme(
    elevation: 0,
    color: ColorPalette.dmCardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  //Тема для таббара
  tabBarTheme: TabBarTheme(
    labelColor: ColorPalette.dmTabBarSelect,
    labelStyle: FontCollection.devHeadline6,
    unselectedLabelColor: ColorPalette.dmTabBarUnSelect,
    unselectedLabelStyle: FontCollection.devHeadline6,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: ColorPalette.dmTabBarCursor,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorPalette.dmNavigationBarBackground,
    showSelectedLabels: false,
    elevation: 4,
    selectedIconTheme: IconThemeData(
      color: ColorPalette.greenColor,
      size: 30,
    ),
    unselectedIconTheme: IconThemeData(
      color: ColorPalette.dmBasicColor,
      size: 30,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorPalette.dmPrimaryColor),
      textStyle: MaterialStateProperty.all(
          FontCollection.devButton.copyWith(color: ColorPalette.lmPrimaryColor)
      ),
    ),
  ),
  textTheme: dmTextTheme,
  iconTheme: const IconThemeData(
    color: ColorPalette.dmIcon,
    size: 30,
  ),
);
