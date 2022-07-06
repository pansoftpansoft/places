import 'package:flutter/material.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/list_places_screen_model.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/app_model.dart';
import 'package:provider/provider.dart';

/// Список подключенных провадеров
List<ChangeNotifierProvider<ChangeNotifier>> listMultiProviders =
    <ChangeNotifierProvider<ChangeNotifier>>[
  ChangeNotifierProvider<AppModel>(
    create: (final context) => AppModel(),
  ),
  ChangeNotifierProvider<SearchScreenInteractor>(
    create: (final context) => SearchScreenInteractor(),
  ),
  ChangeNotifierProvider<VisitingInteractor>(
    create: (final context) => VisitingInteractor(),
  ),
  ChangeNotifierProvider<AddPlaceInteractor>(
    create: (final context) => AddPlaceInteractor(),
  ),
  ChangeNotifierProvider<DetailsPlaceInteractor>(
    create: (final context) => DetailsPlaceInteractor(),
  ),
  ChangeNotifierProvider<ListPlacesScreenModel>(
    create: (final context) => ListPlacesScreenModel(),
  ),
  ChangeNotifierProvider<OnboardingScreenInteractor>(
    create: (final context) => OnboardingScreenInteractor(),
  ),
  ChangeNotifierProvider<FiltersScreenInteractor>(
    create: (final context) => FiltersScreenInteractor(),
  ),
];
