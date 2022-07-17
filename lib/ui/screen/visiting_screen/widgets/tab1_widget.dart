import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1_widget_empty_list.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';

/// Вкладка запланированные места
class Tab1Widget extends StatelessWidget {
  ///
  const Tab1Widget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => mocksWantVisit.isEmpty
      ? const Tab1WidgetEmptyList()
      : ListView.separated(
          separatorBuilder: (context, index) => const SizedBox12(),
          itemCount: mocksWantVisit.length,
          itemBuilder: (context, index) => ListViewCardDrag(index),
        );
}
