import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_screen/visited_tab/visited_tab_bloc.dart';
import 'package:places/blocs/visiting_screen/want_visit_tab/want_visit_tab_bloc.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';

/// Список подключенных провадеров
List<BlocProvider> listMultiBlocProviders = <BlocProvider>[
  BlocProvider<WantVisitTabBloc>(
    create: (context) => WantVisitTabBloc(
      context.read<VisitingInteractor>(),
    ),
  ),
  BlocProvider<VisitedTabBloc>(
    create: (context) => VisitedTabBloc(
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
    ),
  ),
];
