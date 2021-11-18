import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/multi_providers.dart';
import 'package:places/ui/res/route_map.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );

  runApp(
    MultiProvider(
      providers: listMultiProviders,
      child: const Main(),
    ),
  );
}

/// Запуск приложения
class Main extends StatelessWidget {
  /// Конструктор
  const Main({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
        //theme: themeActual,
        theme: context.select<AppModel, ThemeData>(
          (final a) => a.themeColor,
        ),
        title: 'Задача  8.2',
        routes: mapRoutes,
        initialRoute: RouteName.splashScreen,
      );
}
