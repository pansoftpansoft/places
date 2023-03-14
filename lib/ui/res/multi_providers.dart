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
import 'package:places/data/repository/place_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Список подключенных провадеров
/// ToDo сюда переносим интеректоры из listMultiProvidersOLD
List<SingleChildWidget> listMultiProviders = [
  Provider(
    create: (context) => AppDb(),
    //dispose: (context)=>AppDb.close(),
  ),
  Provider(
    create: (context) => AppModel(),
  ),
  Provider(
    create: (context) => SearchInteractor(),
  ),
  Provider(
    create: (context) => ListPlacesInteractor(),
  ),
  Provider(
    create: (context) => FiltersInteractor(),
  ),
  Provider(
    create: (context) => SettingsInteractor(),
  ),
  Provider(
    create: (context) => PlaceInteractor(),
  ),
  Provider(
    create: (context) => PlaceRepository(),
  ),
  Provider(
    create: (context) => OnboardingInteractor(),
  ),
  Provider(
    create: (context) => DetailsPlaceInteractor(),
  ),
  Provider(
    create: (context) => AddPlaceInteractor(),
  ),
  Provider(
    create: (context) => VisitingInteractor(),
  ),
];
