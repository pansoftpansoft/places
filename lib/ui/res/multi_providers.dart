import 'package:places/data/api/api_client.dart';
import 'package:places/data/database/app_db.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/filters_interactor.dart';
import 'package:places/data/interactor/list_places_interactor.dart';
import 'package:places/data/interactor/onboarding_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/interactor/settings_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/app_model.dart';
import 'package:places/data/repository/place_repository_moor.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Список подключенных провадеров
/// ToDo сюда переносим интеректоры из listMultiProvidersOLD
List<SingleChildWidget> listMultiProviders = [
  Provider<AppDb>(
    create: (context) => AppDb(),
    dispose: (context, appDb) => appDb.close(),
  ),

  Provider<ApiClient>(
    create: (context) => ApiClient(),
  ),
  Provider<AppModel>(
    create: (context) => AppModel(),
  ),
  Provider(
    create: (context) => FiltersInteractor(),
  ),
  Provider(
    create: (context) => SettingsInteractor(),
  ),
  Provider(
    create: (context) => OnboardingInteractor(),
  ),
  ProxyProvider<AppDb, SearchRepository>(
    update: (context, appDb, searchRepository) {
      return SearchRepository(appDb);
    },
  ),
  ProxyProvider2<AppDb,ApiClient, PlaceRepositoryMoor>(
    update: (context, appDb, apiClient,placeRepositoryMoor) {
      return PlaceRepositoryMoor(appDb, apiClient);
    },
  ),
  ProxyProvider<SearchRepository, SearchInteractor>(
    update: (context, searchRepository, searchInteractor) {
      return SearchInteractor(searchRepository);
    },
  ),
  ProxyProvider<PlaceRepositoryMoor, ListPlacesInteractor>(
    update: (context, placeRepositoryMoor, listPlacesInteractor) {
      return ListPlacesInteractor(placeRepositoryMoor);
    },
  ),
  ProxyProvider<PlaceRepositoryMoor, AddPlaceInteractor>(
    update: (context, placeRepositoryMoor, addPlaceInteractor) {
      return AddPlaceInteractor(placeRepositoryMoor);
    },
  ),
  ProxyProvider<PlaceRepositoryMoor, VisitingInteractor>(
    update: (context, placeRepositoryMoor, visitingInteractor) {
      return VisitingInteractor(placeRepositoryMoor);
    },
  ),
  ProxyProvider<PlaceRepositoryMoor, PlaceInteractor>(
    update: (context, placeRepositoryMoor, placeInteractor) {
      return PlaceInteractor(placeRepositoryMoor);
    },
  ),
  ProxyProvider<PlaceRepositoryMoor, DetailsPlaceInteractor>(
    update: (context, placeRepositoryMoor, detailsPlaceInteractor) {
      return DetailsPlaceInteractor(placeRepositoryMoor);
    },
  ),
];
