import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';

//import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_visited_bloc/list_visited_bloc.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_visited_empty.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_visited_filled.dart';

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
            debugPrint('зашли ${state.toString()}');

            return state is ListVisitedPlaceSelectedState;
          },
          listener: (context, state) {
            context.read<DetailsPlaceBloc>().add(
                  DetailsPlaceEvents.onLoad(
                    place: (state as ListVisitedPlaceSelectedState).placeVisit,
                    index: 0,
                  ),
                );

            Navigator.pushNamed(context, RouteName.detailsPlaceScreen);


            return;
          },
        ),
      ],
      child: BlocBuilder<ListVisitedBloc, ListVisitedState>(
        builder: (context, state) {
          debugPrint('state.toString() = ${state.toString()}');

          return state.props.isEmpty
              ? const ListVisitedEmpty()
              : (state.props.first as List<Place>).isEmpty
                  ? const ListVisitedEmpty()
                  : const ListVisitedFilled();
        },
      ),
    );
  }
}
