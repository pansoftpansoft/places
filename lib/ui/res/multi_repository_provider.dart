import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';

/// Список подключенных репозиториев
List<RepositoryProvider> listMultiRepositoryProvider = <RepositoryProvider>[
  RepositoryProvider<ListPlacesScreenInteractor>(
    create: (context) => ListPlacesScreenInteractor(),
  ),
];
