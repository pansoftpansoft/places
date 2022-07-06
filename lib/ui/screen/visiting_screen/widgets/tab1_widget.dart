import 'package:flutter/material.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1_widget_empty_list.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';
import 'package:provider/provider.dart';

/// Вкладка запланированные места
class Tab1Widget extends StatelessWidget {
  ///
  const Tab1Widget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<VisitingInteractor>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            mocksWantVisit.isEmpty
                ? const Tab1WidgetEmptyList()
                : ListView.separated(
                    separatorBuilder: (final context, final index) =>
                        const SizedBox12(),
                    itemCount: mocksWantVisit.length,
                    itemBuilder: (final context, final index) =>
                        ListViewCardDrag(index),
                  ),
      );
}
