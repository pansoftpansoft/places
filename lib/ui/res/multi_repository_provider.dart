import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/list_places_interactor.dart';

/// Список подключенных репозиториев
List<RepositoryProvider> listMultiRepositoryProvider = <RepositoryProvider>[
  RepositoryProvider<ListPlacesInteractor>(
    create: (context) => ListPlacesInteractor(),
  ),
];
