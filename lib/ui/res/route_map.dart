import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_category.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/map_screen/map_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screen/settings_screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen/splash_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';




///Мапа маршрутов
final Map<String, Widget Function(BuildContext context)> mapRoutes =
    <String, Widget Function(BuildContext context)>{
  '/AddSightScreen': (final BuildContext context) => const AddSightScreen(),
  '/FiltersScreen': (final BuildContext context) => const FiltersScreen(),
  '/MapScreen': (final BuildContext context) => const MapScreen(),
  '/OnboardingScreen': (final BuildContext context) => const OnboardingScreen(),
  '/SelectCategory': (final BuildContext context) => SelectCategory(),
  '/SettingsScreen': (final BuildContext context) => const SettingsScreen(),
  '/SightDetails': (final BuildContext context) => SightDetails(),
  '/SightListScreen': (final BuildContext context) => const SightListScreen(),
  '/SightSearchScreen': (final BuildContext context) =>
      const SightSearchScreen(),
  '/SplashScreen': (final BuildContext context) => const SplashScreen(),
  '/VisitingScreen': (final BuildContext context) => const VisitingScreen(),
};
