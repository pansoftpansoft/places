import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_screen/visited_tab/visited_tab_bloc.dart';
import 'package:places/blocs/visiting_screen/want_visit_tab/want_visit_tab_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';

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
];
