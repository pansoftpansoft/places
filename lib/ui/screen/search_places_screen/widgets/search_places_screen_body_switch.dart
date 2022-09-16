import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_state_enum.dart';
import 'package:places/ui/screen/search_places_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/list_found_places_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/load_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/search_not_found_screen.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_screen.dart';

class SearchPlacesScreenBodySwitch extends StatelessWidget {
  const SearchPlacesScreenBodySwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SearchPlacesBloc>().add(
          const SearchPlacesEvents.load(),
        );

    return MultiBlocListener(
      listeners: [
        BlocListener<SearchPlacesBloc, SearchPlacesState>(
          listenWhen: (previousState, state) =>
              state.current == SearchStateEnum.showSelected,
          listener: (context, state) async {
            debugPrint('!!!state = ${state.current}');
            await showModalBottomSheet<Widget>(
              context: context,
              builder: (_) => const DetailsPlaceScreen(),
              isScrollControlled: true,
              isDismissible: true,
              useRootNavigator: true,
            );
          },
        ),
      ],
      child: BlocBuilder<SearchPlacesBloc, SearchPlacesState>(
        builder: (context, state) {
          switch (state.current) {
            case SearchStateEnum.load:
              return const LoadScreen();
            case SearchStateEnum.showSearch:
              return const ListFoundPlacesScreen();
            case SearchStateEnum.showListHistory:
              return const ListHistoryScreen();
            case SearchStateEnum.showEmpty:
              return const EmptyScreen(
                textHeader: insertText,
                textComment: '',
                svgIcon: SvgIcons.info,
              );
            case SearchStateEnum.showNotFound:
              return const SearchNotFoundScreen();
            case SearchStateEnum.error:
              return const EmptyScreen(
                textHeader: unknownError,
                textComment: tryAgain,
                svgIcon: SvgIcons.delete,
              );
            case SearchStateEnum.showSelected:
              return const ListFoundPlacesScreen();

            default:
              debugPrint('Почемуто попадаем сюда default  = ${state.current}');
              return const EmptyScreen(
                textHeader: unknownError,
                textComment: tryAgain,
                svgIcon: SvgIcons.delete,
              );
          }
        },
      ),
    );
  }
}
