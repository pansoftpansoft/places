import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_visited_bloc/list_visited_bloc.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_visited_filled.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_visited_empty.dart';

/// Вкладка посещенных мест
class ListVisited extends StatelessWidget {
  ///
  const ListVisited({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ListVisitedBloc, ListVisitedState>(
          listenWhen: (previousState, state) {
            return state is ListVisitedPlaceSelectedState;
          },
          listener: (context, state) {
            showModalBottomSheet<Widget>(
              context: context,
              builder: (_) => DetailsPlaceScreen(
                place: state.props.first as Place,
              ),
              isScrollControlled: true,
              isDismissible: true,
              useRootNavigator: true,
            );

            context.read<ListWantVisitBloc>().add(ListWantVisitLoadEvent());
            context.read<ListVisitedBloc>().add(ListVisitedLoadEvent());

            return;
          },
        ),
      ],
      child: BlocBuilder<ListVisitedBloc, ListVisitedState>(
        builder: (context, state) {
          return mocksVisited.isEmpty
              ? const ListVisitedEmpty()
              : const ListVisitedFilled();
        },
      ),
    );
  }
}
