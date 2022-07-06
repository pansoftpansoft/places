import 'package:flutter/material.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';

import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/list_places_screen/list_places_screen.dart';
import 'package:places/ui/screen/map_screen/map_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screen/search_places_screen/search_places_screen.dart';
import 'package:places/ui/screen/select_category/select_category.dart';
import 'package:places/ui/screen/settings_screen/settings_screen.dart';
import 'package:places/ui/screen/splash_screen/splash_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';

///Мапа маршрутов
final Map<String, Widget Function(BuildContext context)> mapRoutes =
    <String, Widget Function(BuildContext context)>{
  RouteName.addPlaceScreen: (final context) => const AddPlaceScreen(),
  RouteName.filtersScreen: (final context) => const FiltersScreen(),
  RouteName.mapScreen: (final context) => const MapScreen(),
  RouteName.onboardingScreen: (final context) => const OnboardingScreen(),
  RouteName.selectCategory: (final context) => const SelectCategory(),
  RouteName.settingsScreen: (final context) => const SettingsScreen(),
  RouteName.detailsPlaceScreen: (final context) => const DetailsPlaceScreen(),
  RouteName.listPlacesScreen: (final context) => const ListPlacesScreen(),
  RouteName.searchPlacesScreen: (final context) => const SearchPlacesScreen(),
  RouteName.splashScreen: (final context) => const SplashScreen(),
  RouteName.visitingScreen: (final context) => const VisitingScreen(),
};
