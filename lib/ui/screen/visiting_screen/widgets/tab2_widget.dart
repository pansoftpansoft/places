import 'package:flutter/material.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/visiting_screen/widgets/empty_list_tab2.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_tab2.dart';
import 'package:provider/provider.dart';

/// Вкладка посещенных мест
class Tab2Widget extends StatelessWidget {
  ///
  const Tab2Widget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<VisitingInteractor>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            mocksVisited.isEmpty ? const EmptyListTab2() : const ListViewTab2(),
      );
}
