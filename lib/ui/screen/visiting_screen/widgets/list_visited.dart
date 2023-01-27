import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_visited_empty.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_tab2.dart';

/// Вкладка посещенных мест
class ListVisited extends StatelessWidget {
  ///
  const ListVisited({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MultiBlocListener(
  //     listeners: [
  //       BlocListener<VisitedTabBloc, VisitedTabState>(
  //         listenWhen: (previousState, state) {
  //           return state is VisitedPlaceSelected;
  //         },
  //         listener: (context, state) {
  //           showModalBottomSheet<Widget>(
  //             context: context,
  //             builder: (_) => DetailsPlaceScreen(
  //               place: state.props.first as Place,
  //             ),
  //             isScrollControlled: true,
  //             isDismissible: true,
  //             useRootNavigator: true,
  //           );
  //
  //           context.read<WantVisitTabBloc>().add(WantVisitTabLoadEvent());
  //           context.read<VisitedTabBloc>().add(VisitedTabLoadEvent());
  //
  //           return;
  //         },
  //       ),
  //     ],
  //     child: BlocBuilder<VisitedTabBloc, VisitedTabState>(
  //       builder: (context, state) {
  //         return mocksVisited.isEmpty
  //             ? const EmptyListTab2()
  //             : const ListViewTab2();
  //       },
  //     ),
  //   );
  // }
}
