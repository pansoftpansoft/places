import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:places/blocs/place_bloc_observer.dart';
import 'package:places/data/api/api_client.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/multi_bloc_providers.dart';
import 'package:places/ui/res/multi_providers.dart';
import 'package:places/ui/res/route_map.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/settings_screen/bloc/settings_bloc.dart';
import 'package:provider/provider.dart';

import 'ui/res/multi_repository_provider.dart';

ThemeData themeColor = lightTheme;
ApiClient apiClient = ApiClient();

void main() {
  //Bloc.observer = PlaceBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  //loadSettings();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );

  runApp(
    MultiRepositoryProvider(
      providers: listMultiRepositoryProvider,
      child: MultiProvider(
        providers: listMultiProviders,
        child: MultiBlocProvider(
          providers: listMultiBlocProviders,
          child: const Main(),
        ),
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
        context.read<SettingsBloc>().add(
              const SettingsEvents.loadSettings(),
            );

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
  }
}
