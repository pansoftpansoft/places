import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:places/data/api/api_client.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/multi_bloc_providers.dart';
import 'package:places/ui/res/multi_providers.dart';
import 'package:places/ui/res/route_map.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/settings_screen/bloc/settings_bloc.dart';
import 'package:provider/provider.dart';

ThemeData themeColor = lightTheme;

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
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            return BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: state.theme,
                  title: appTitle,
                  routes: mapRoutes,
                  initialRoute: RouteName.splashScreen,
                );
              },
            );
          },
        );
      },
    );
  }
}
