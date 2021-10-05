import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/text_themas.dart';

import 'font_collection.dart';

//---Светлая тема
final lightTheme = ThemeData(
  primaryColor: ColorPalette.lmPrimaryColor,
  backgroundColor: ColorPalette.lmPrimaryColor,
  scaffoldBackgroundColor: ColorPalette.lmPrimaryColor,
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),
  /*
  * appBarTheme
  */
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: ColorPalette.lmPrimaryColor,
  ),
  /*
  * cardTheme
  */
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.borderRadiusCard),
    ),
    color: ColorPalette.lmCardColor,
  ),
  /*
  * tabBarTheme
  */
  tabBarTheme: TabBarTheme(
    labelColor: ColorPalette.lmTabBarSelect,
    labelStyle: FontCollection.devHeadline6,
    unselectedLabelColor: ColorPalette.lmTabBarUnSelect,
    unselectedLabelStyle: FontCollection.devHeadline6,
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: ColorPalette.lmTabBarCursor),
  ),
  /*
  * bottomNavigationBarTheme
  */
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorPalette.lmNavigationBarBackground,
    showSelectedLabels: false,
    elevation: 10,
    selectedIconTheme: IconThemeData(color: ColorPalette.greenColor, size: 30),
    unselectedIconTheme:
        IconThemeData(color: ColorPalette.lmBasicColor, size: 30),
  ),
  /*
  * textButtonTheme
  */
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorPalette.lmPrimaryColor),
      textStyle: MaterialStateProperty.all(FontCollection.devButton),
    ),
  ),
  /*
  * iconTheme
  */
  // iconTheme: const IconThemeData(
  //   color: ColorPalette.lmIcon,
  //   size: 30,
  // ),
  // primaryIconTheme: const IconThemeData(
  //   color: ColorPalette.lmIcon,
  //   size: 30,
  // ),
  // accentIconTheme: const IconThemeData(
  //   color: ColorPalette.lmIcon,
  //   size: 30,
  // ),
  /*
  * textTheme
  */
  textTheme: lmTextTheme,
);
//----------------------------------------------------------------------
// ---Темная тема--------------------------------------------------------
//----------------------------------------------------------------------
final darkTheme = ThemeData(
  primaryColor: ColorPalette.dmPrimaryColor,
  backgroundColor: ColorPalette.dmPrimaryColor,
  scaffoldBackgroundColor: ColorPalette.dmPrimaryColor,
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),
  /*
  * appBarTheme
  */
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorPalette.dmPrimaryColor,
    elevation: 0,
    centerTitle: true,
  ),
  /*
  * cardTheme
  */
  cardTheme: CardTheme(
    elevation: 0,
    color: ColorPalette.dmCardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.borderRadiusCard),
    ),
  ),
  /*
  * tabBarTheme
  */
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
  /*
  * bottomNavigationBarTheme
  */
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorPalette.dmNavigationBarBackground,
    showSelectedLabels: false,
    elevation: 4,
    selectedIconTheme: IconThemeData(
      color: ColorPalette.dmBasicColor,
      size: 30,
    ),
    unselectedIconTheme: IconThemeData(
      color: ColorPalette.dmBasicColor,
      size: 30,
    ),
  ),
  /*
  * textButtonTheme
  */
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorPalette.dmPrimaryColor),
      textStyle: MaterialStateProperty.all(FontCollection.devButton
          .copyWith(color: ColorPalette.lmPrimaryColor)),
    ),
  ),
  /*
  * iconTheme
  */
  iconTheme: const IconThemeData(
    color: ColorPalette.dmIcon,
    size: 30,
  ),
  /*
  * textTheme
  */
  textTheme: dmTextTheme,

);
