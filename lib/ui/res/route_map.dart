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
  RouteName.addPlaceScreen: (context) => const AddPlaceScreen(),
  RouteName.filtersScreen: (context) => const FiltersScreen(),
  RouteName.mapScreen: (context) => const MapScreen(),
  RouteName.onboardingScreen: (context) => const OnboardingScreen(),
  RouteName.selectCategory: (context) => const SelectCategory(),
  RouteName.settingsScreen: (context) => const SettingsScreen(),
  RouteName.detailsPlaceScreen: (context) => const DetailsPlaceScreen(),
  RouteName.listPlacesScreen: (context) => const ListPlacesScreen(),
  RouteName.searchPlacesScreen: (context) => const SearchPlacesScreen(),
  RouteName.splashScreen: (context) => const SplashScreen(),
  RouteName.visitingScreen: (context) => const VisitingScreen(),
};
