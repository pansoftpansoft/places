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
      color: ColorPalette.greenColor,
      size: 30,
    ),
    unselectedIconTheme:
        IconThemeData(color: ColorPalette.lmBasicColor, size: 30),
  ),

  ///TextButtonTheme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.lmTextButtonTextDisable;
          }

          return ColorPalette.lmTextButtonText;
        },
      ),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.lmTextButtonBackgroundDisable;
          }

          return ColorPalette.lmTextButtonBackground;
        },
      ),
    ),
  ),

  /// textTheme
  textTheme: lmTextTheme,

  /// IconTheme
  iconTheme: const IconThemeData(
    color: ColorPalette.lmIconOnBoard,
  ),
  indicatorColor: ColorPalette.lmBasicColor,

  /// ElevatedButtonTheme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.lmElevatedButtonBackgroundDisable;
          }

          return ColorPalette.lmElevatedButtonBackground;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.lmElevatedButtonTextDisable;
          }

          return ColorPalette.lmElevatedButtonText;
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
        ),
      ),
    ),
  ),
);

///
/// Темная тема
///
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
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.dmTextButtonTextDisable;
          }

          return ColorPalette.dmTextButtonText;
        },
      ),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          debugPrint(
            'states.contains(MaterialState.disabled = '
            '${states.contains(MaterialState.disabled)}',
          );

          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.dmTextButtonBackgroundDisable;
          }

          return ColorPalette.dmTextButtonBackground;
        },
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

  /// elevatedButton
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.dmElevatedButtonTextDisable;
          }

          return ColorPalette.dmElevatedButtonText;
        },
      ),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          debugPrint(
            'states.contains(MaterialState.disabled = '
            '${states.contains(MaterialState.disabled)}',
          );

          if (states.contains(MaterialState.disabled)) {
            return ColorPalette.dmElevatedButtonBackgroundDisable;
          }

          return ColorPalette.dmElevatedButtonBackground;
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
        ),
      ),
    ),
  ),
);
