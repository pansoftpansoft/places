import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';

/// Список подключенных провадеров
List<ChangeNotifierProvider<ChangeNotifier>> listMultiProviders =
    <ChangeNotifierProvider<ChangeNotifier>>[
  ChangeNotifierProvider<AppModel>(
    create: (final BuildContext context) => AppModel(),
  ),
  ChangeNotifierProvider<SearchFilterModel>(
    create: (final BuildContext context) => SearchFilterModel(),
  ),
  ChangeNotifierProvider<VisitingModel>(
    create: (final BuildContext context) => VisitingModel(),
  ),
  ChangeNotifierProvider<AddSightModel>(
    create: (final BuildContext context) => AddSightModel(),
  ),
  ChangeNotifierProvider<SightDetailsModel>(
    create: (final BuildContext context) => SightDetailsModel(),
  ),
];
