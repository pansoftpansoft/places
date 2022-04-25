import 'package:flutter/material.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/map_screen/map_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screen/select_category/select_category.dart';
import 'package:places/ui/screen/settings_screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen/splash_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';

///Мапа маршрутов
final Map<String, Widget Function(BuildContext context)> mapRoutes =
    <String, Widget Function(BuildContext context)>{
  RouteName.addSightScreen: (final context) => const AddSightScreen(),
  RouteName.filtersScreen: (final context) => const FiltersScreen(),
  RouteName.mapScreen: (final context) => const MapScreen(),
  RouteName.onboardingScreen: (final context) => const OnboardingScreen(),
  RouteName.selectCategory: (final context) => const SelectCategory(),
  RouteName.settingsScreen: (final context) => const SettingsScreen(),
  RouteName.sightDetailsScreen: (final context) => const SightDetailsScreen(),
  RouteName.sightListScreen: (final context) => const SightListScreen(),
  RouteName.sightSearchScreen: (final context) => const SightSearchScreen(),
  RouteName.splashScreen: (final context) => const SplashScreen(),
  RouteName.visitingScreen: (final context) => const VisitingScreen(),
};
