import 'package:flutter/material.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/app_model.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:provider/provider.dart';

/// Список подключенных провадеров
List<ChangeNotifierProvider<ChangeNotifier>> listMultiProviders =
    <ChangeNotifierProvider<ChangeNotifier>>[
  ChangeNotifierProvider<AppModel>(
    create: (context) => AppModel(),
  ),
  ChangeNotifierProvider<SearchScreenInteractor>(
    create: (context) => SearchScreenInteractor(),
  ),
  ChangeNotifierProvider<VisitingInteractor>(
    create: (context) => VisitingInteractor(),
  ),
  ChangeNotifierProvider<AddPlaceInteractor>(
    create: (context) => AddPlaceInteractor(),
  ),
  ChangeNotifierProvider<DetailsPlaceInteractor>(
    create: (context) => DetailsPlaceInteractor(),
  ),
  ChangeNotifierProvider<ListPlacesScreenInteractor>(
    create: (context) => ListPlacesScreenInteractor(),
  ),
  ChangeNotifierProvider<OnboardingScreenInteractor>(
    create: (context) => OnboardingScreenInteractor(),
  ),
  ChangeNotifierProvider<FiltersScreenInteractor>(
    create: (context) => FiltersScreenInteractor(),
  ),
  ChangeNotifierProvider<PlaceRepository>(
    create: (context) => PlaceRepository(),
  ),
  ChangeNotifierProvider<PlaceInteractor>(
    create: (context) => PlaceInteractor(),
  ),
];
