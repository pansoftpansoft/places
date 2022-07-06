import 'package:flutter/material.dart';
import 'package:places/data/model/app_model.dart';
import 'package:places/data/interactor/add_place_model.dart';
import 'package:places/ui/screen/details_place_screen/models/details_place_model.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/search_places_screen/models/search_screen_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';

/// Список подключенных провадеров
List<ChangeNotifierProvider<ChangeNotifier>> listMultiProviders =
    <ChangeNotifierProvider<ChangeNotifier>>[
  ChangeNotifierProvider<AppModel>(
    create: (final context) => AppModel(),
  ),
  ChangeNotifierProvider<SearchScreenModel>(
    create: (final context) => SearchScreenModel(),
  ),
  ChangeNotifierProvider<VisitingModel>(
    create: (final context) => VisitingModel(),
  ),
  ChangeNotifierProvider<AddPlaceModel>(
    create: (final context) => AddPlaceModel(),
  ),
  ChangeNotifierProvider<DetailsPlaceModel>(
    create: (final context) => DetailsPlaceModel(),
  ),
  ChangeNotifierProvider<ListPlacesScreenModel>(
    create: (final context) => ListPlacesScreenModel(),
  ),
  ChangeNotifierProvider<OnboardingScreenModel>(
    create: (final context) => OnboardingScreenModel(),
  ),
  ChangeNotifierProvider<FiltersScreenModel>(
    create: (final context) => FiltersScreenModel(),
  ),
];
