import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/loader_size.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
//import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_want_visit_empty.dart';
import 'package:places/ui/screen/widgets/loader.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';

/// Вкладка запланированные места
class ListWantVisit extends StatelessWidget {
  ///
  const ListWantVisit({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<ListWantVisitBloc, ListWantVisitState>(
            listenWhen: (previousState, state) {
              debugPrint('зашли ${state.toString()}');

              return state is ListWantVisitPlaceSelectedState;
            },
            listener: (context, state) {
              debugPrint('See details from ListWantVisit');
              context.read<DetailsPlaceBloc>().add(
                    DetailsPlaceEvents.onLoad(
                      place: (state as ListWantVisitPlaceSelectedState).place,
                      index: 0,
                    ),
                  );

              Navigator.pushNamed(context, RouteName.detailsPlaceScreen);

              // showModalBottomSheet<Widget>(
              //   context: context,
              //   builder: (_) {
              //     context.read<DetailsPlaceBloc>().add(
              //           DetailsPlaceEvents.onLoad(
              //             place:
              //                 (state as ListWantVisitPlaceSelectedState).place,
              //             index: 0,
              //           ),
              //         );
              //
              //     return const DetailsPlaceScreen();
              //   },
              //   isScrollControlled: true,
              //   isDismissible: true,
              //   useRootNavigator: true,
              // );
              // debugPrint('Я уже сдесь');
              //
              // return;
            },
          ),
        ],
        child: BlocBuilder<ListWantVisitBloc, ListWantVisitState>(
          builder: (context, state) {
            debugPrint('mocksWantVisit.length, =  ${mocksWantVisit.length}');
            debugPrint('mocksWantVisit.length, =  ${state.toString()}');

            return state == ListWantVisitLoadState()
                ? Column(
                    children: const [
                      SizedBox(
                        height: height95,
                      ),
                      SizedBox(
                        height: height95,
                        width: height95,
                        child: Loader(LoaderSize.small),
                      ),
                    ],
                  )
                : mocksWantVisit.isEmpty
                    ? const ListWantVisitEmpty()
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox12(),
                        itemCount: mocksWantVisit.length,
                        itemBuilder: (context, index) {
                          return ListViewCardDrag(index);
                        },
                      );
          },
        ),
      );
}
