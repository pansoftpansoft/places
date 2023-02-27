import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/data/interactor/settings_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';
import 'package:places/ui/screen/select_category/bloc/select_category_bloc.dart';
import 'package:places/ui/screen/settings_screen/bloc/settings_bloc.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_visited_bloc/list_visited_bloc.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';

/// Список подключенных провадеров
List<BlocProvider> listMultiBlocProviders = <BlocProvider>[
  BlocProvider<ListWantVisitBloc>(
    create: (context) => ListWantVisitBloc(
      context.read<VisitingInteractor>(),
    ),
  ),
  BlocProvider<ListVisitedBloc>(
    create: (context) => ListVisitedBloc(
      context.read<VisitingInteractor>(),
    ),
  ),
  BlocProvider<ListPlacesBloc>(
    create: (context) => ListPlacesBloc(
      context.read<ListPlacesScreenInteractor>(),
    )..add(const ListPlacesEvents.load()),
  ),
  BlocProvider<DetailsPlaceBloc>(
    create: (context) => DetailsPlaceBloc(
      context.read<DetailsPlaceInteractor>(),
      context.read<PlaceInteractor>(),
    ),
  ),
  BlocProvider<SettingsBloc>(
    create: (context) => SettingsBloc(
      context.read<SettingsInteractor>(),
    )..add(
        const SettingsEvents.loadSettings(),
      ),
  ),
  BlocProvider<OnboardingBloc>(
    create: (context) => OnboardingBloc(
      context.read<OnboardingScreenInteractor>(),
    ),
  ),
  BlocProvider<AddPlaceBloc>(
    create: (context) => AddPlaceBloc(),
  ),
  BlocProvider<SelectCategoryBloc>(
    create: (context) => SelectCategoryBloc(),
  ),
  BlocProvider<SearchPlacesBloc>(
    create: (context) => SearchPlacesBloc(
      context.read<SearchScreenInteractor>(),
    ),
  ),
  BlocProvider<FilterBloc>(
    create: (context) => FilterBloc(
      context.read<FiltersScreenInteractor>(),
    ),
  ),
];
