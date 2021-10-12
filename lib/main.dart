import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';

//import 'package:places/ui/screen/filters_screen.dart';
//import 'package:places/ui/screen/settings_screen.dart';
//import 'package:places/ui/screen/sight_details_screen.dart';
// import 'package:places/ui/screen/visiting_screen.dart';
// import 'package:places/mocks.dart';
// import 'package:places/ui/res/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );

  runApp(
    MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
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
      ],
      child: const MyApp(),
    ),
  );
}

/// Запуск приложения
class MyApp extends StatelessWidget {
  /// Конструктор
  const MyApp({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
        //theme: themeActual,
        theme: context.select<AppModel, ThemeData>(
          (final AppModel a) => a.themeColor,
        ),
        title: 'Задача  5.2',
        home: const SightListScreen(),


        //home: const OnboardingScreen(),
        // home: const VisitingScreen(),
        // home: SightDetails(mocks[1]),
        // home: FiltersScreen(),
        // home: SettingsScreen(),
        // home: Test(),
        // home: AddSightScreen(),
        // home: const SelectCategory(),
      );
}
