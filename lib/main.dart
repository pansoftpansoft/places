import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/place_bloc_observer.dart';
import 'package:places/data/api/api_client.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/ui/res/multi_bloc_providers.dart';
import 'package:places/ui/res/multi_providers.dart';
import 'package:places/ui/res/route_map.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/settings_screen/bloc/settings_bloc.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'redux/middleware/find_place_middleware.dart';
import 'redux/reducer/reducer.dart';
import 'ui/res/multi_repository_provider.dart';

ThemeData themeColor = lightTheme;
ApiClient apiClient = ApiClient();

void main() {
  Bloc.observer = PlaceBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  //loadSettings();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );

  final store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: [FindPlaceMiddleware(SearchScreenInteractor())],
  );

  runApp(
    MultiRepositoryProvider(
      providers: listMultiRepositoryProvider,
      child: MultiProvider(
        providers: listMultiProviders,
        child: MultiBlocProvider(
          providers: listMultiBlocProviders,
          child: Main(
            store: store,
          ),
        ),
      ),
    ),
  );
}

/// Запуск приложения
class Main extends StatelessWidget {
  final Store<AppState> store;

  /// Конструктор
  const Main({
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              theme: state.theme,
              title: 'Мои путешествия',
              routes: mapRoutes,
              initialRoute: RouteName.splashScreen,
            );
          },
        );
      },
    );
  }
}
