import 'package:flutter/material.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//import 'package:places/ui/screen/filters_screen.dart';
//import 'package:places/ui/screen/settings_screen.dart';
//import 'package:places/ui/screen/sight_details.dart';
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
      providers: [
        ChangeNotifierProvider<AppModel>(
          create: (context) => AppModel(),
        ),
        ChangeNotifierProvider<SearchFilterModel>(
          create: (context) => SearchFilterModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: themeActual,
      theme: context.select<AppModel, ThemeData>((AppModel a) => a.themeColor),
      title: 'Задача  5.2',
      // home: const VisitingScreen(),
      // home: const VisitingScreen(),
      home: const SightListScreen(),
      // home: SightDetails(mocks[1]),
      // home: FiltersScreen(),
      // home: SettingsScreen(),
      // home: Test(),
      // home: AddSightScreen(),
      // home: const SelectCategory(),
    );
  }
}
