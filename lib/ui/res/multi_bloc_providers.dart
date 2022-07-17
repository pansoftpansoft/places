import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_screen/visiting_screen_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';

/// Список подключенных провадеров
List<BlocProvider> listMultiBlocProviders = <BlocProvider>[
  BlocProvider<VisitingScreenBloc>(
    create: (context) => VisitingScreenBloc(
      context.read<VisitingInteractor>(),
    ),
  ),
];
