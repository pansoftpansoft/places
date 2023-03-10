import 'package:places/data/database/app_db.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
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
  ),
  Provider(
    create: (context) => AppModel(),
  ),
  Provider(
    create: (context) => SearchScreenInteractor(),
  ),
  Provider(
    create: (context) => ListPlacesScreenInteractor(),
  ),
  Provider(
    create: (context) => FiltersScreenInteractor(),
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
    create: (context) => OnboardingScreenInteractor(),
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
