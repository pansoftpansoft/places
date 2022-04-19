import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/font_collection.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/text_themas.dart';

///Светлая тема
final ThemeData lightTheme = ThemeData(

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
    cardTheme: const CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
      ),
      color: ColorPalette.lmCardColor,
    ),
    /*
  * tabBarTheme
  */
    tabBarTheme: const TabBarTheme(
      labelColor: ColorPalette.lmTabBarSelect,
      labelStyle: devHeadline6,
      unselectedLabelColor: ColorPalette.lmTabBarUnSelect,
      unselectedLabelStyle: devHeadline6,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusTapBar)),
        color: ColorPalette.lmTabBarCursor,
      ),
    ),
    /*
  * bottomNavigationBarTheme
  */
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.lmNavigationBarBackground,
      showSelectedLabels: true,
      elevation: 10,
      selectedIconTheme: IconThemeData(
          color: ColorPalette.greenColor, size: 30),
      unselectedIconTheme:
      IconThemeData(color: ColorPalette.lmBasicColor, size: 30),
    ),
    /*
  * textButtonTheme
  */
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorPalette.lmPrimaryColor),
        textStyle: MaterialStateProperty.all(devButton),
      ),
    ),
    /*
  * textTheme
  */
    textTheme: lmTextTheme,
    iconTheme: const IconThemeData(
      color: ColorPalette.lmIconOnBoard,
    ),

    indicatorColor: ColorPalette.lmBasicColor,

);

/// Темная тема
final ThemeData darkTheme = ThemeData(
  primaryColor: ColorPalette.dmPrimaryColor,
  backgroundColor: ColorPalette.dmPrimaryColor,
  scaffoldBackgroundColor: ColorPalette.dmPrimaryColor,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    modalBackgroundColor: Colors.transparent,
  ),
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
  cardTheme: const CardTheme(
    elevation: 0,
    color: ColorPalette.dmCardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
    ),
  ),
  /*
  * tabBarTheme
  */
  tabBarTheme: const TabBarTheme(
    labelColor: ColorPalette.dmTabBarSelect,
    labelStyle: devHeadline6,
    unselectedLabelColor: ColorPalette.dmTabBarUnSelect,
    unselectedLabelStyle: devHeadline6,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusTapBar)),
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
      textStyle: MaterialStateProperty.all(
        devButton.copyWith(color: ColorPalette.lmPrimaryColor),
      ),
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

  indicatorColor: ColorPalette.dmBasicColor,
);
