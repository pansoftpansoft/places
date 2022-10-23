import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_screen/visited_tab/visited_tab_bloc.dart';
import 'package:places/blocs/visiting_screen/want_visit_tab/want_visit_tab_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1_widget_empty_list.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';

/// Вкладка запланированные места
class Tab1WantVisitWidget extends StatelessWidget {
  ///
  const Tab1WantVisitWidget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<WantVisitTabBloc, WantVisitTabState>(
            listenWhen: (previousState, state) {
              return state is WantVisitPlaceSelected;
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
              context.read<VisitedTabBloc>().add(VisitedTabLoadEvent());
              context.read<WantVisitTabBloc>().add(WantVisitTabLoadEvent());

              return;
            },
          ),
        ],
        child: BlocBuilder<WantVisitTabBloc, WantVisitTabState>(
          builder: (context, state) {
            return mocksWantVisit.isEmpty
                ? const Tab1WidgetEmptyList()
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox12(),
                    itemCount: mocksWantVisit.length,
                    itemBuilder: (context, index) {
                      return ListViewCardDrag(index);
                    },
                  );
          },
        ),
      );
}
