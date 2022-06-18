import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/sight_list_screen/models/sight_list_screen_model.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';

/// Список подключенных провадеров
List<ChangeNotifierProvider<ChangeNotifier>> listMultiProviders =
    <ChangeNotifierProvider<ChangeNotifier>>[
  ChangeNotifierProvider<AppModel>(
    create: (final context) => AppModel(),
  ),
  ChangeNotifierProvider<SearchFilterModel>(
    create: (final context) => SearchFilterModel(),
  ),
  ChangeNotifierProvider<VisitingModel>(
    create: (final context) => VisitingModel(),
  ),
  ChangeNotifierProvider<AddSightModel>(
    create: (final context) => AddSightModel(),
  ),
  ChangeNotifierProvider<SightDetailsModel>(
    create: (final context) => SightDetailsModel(),
  ),
  ChangeNotifierProvider<SightListScreenModel>(
    create: (final context) => SightListScreenModel(),
  ),
  ChangeNotifierProvider<OnboardingScreenModel>(
    create: (final context) => OnboardingScreenModel(),
  ),
  ChangeNotifierProvider<FiltersScreenModel>(
    create: (final context) => FiltersScreenModel(),
  ),
];
