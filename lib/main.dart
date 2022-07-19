import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/api/api_client.dart';
import 'package:places/data/interactor/settings_interactor.dart';
import 'package:places/data/model/app_model.dart';
import 'package:places/ui/res/multi_bloc_providers.dart';
import 'package:places/ui/res/multi_providers.dart';
import 'package:places/ui/res/route_map.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/themes.dart';
import 'package:provider/provider.dart';

ThemeData themeColor = lightTheme;
ApiClient apiClient = ApiClient();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  loadSettings();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );

  runApp(
    MultiProvider(
      providers: listMultiProviders,
      child: MultiBlocProvider(
        providers: listMultiBlocProviders,
        child: const Main(),
      ),
    ),
  );
}

/// Запуск приложения
class Main extends StatelessWidget {
  /// Конструктор
  const Main({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: context.select<AppModel, ThemeData>(
          (a) => themeColor,
        ),
        title: 'Задача  8.2',
        routes: mapRoutes,
        initialRoute: RouteName.splashScreen,
      );
}

Future<void> loadSettings() async {
  themeColor = await SettingsInteractor.getSettingsTheme('themes');
  await SettingsInteractor.updateSettingsThemeColor(themeColor);

  return;
}
