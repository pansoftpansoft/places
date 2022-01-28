import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1_widget_empty_list.dart';
import 'package:provider/provider.dart';

/// Вкладка запланированные места
class Tab1Widget extends StatelessWidget {
  ///
  const Tab1Widget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<VisitingModel>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            mocksWantVisit.isEmpty
                ? const Tab1WidgetEmptyList()
                : ListView.builder(
                    itemCount: mocksWantVisit.length,
                    itemBuilder: (final context, final index) =>
                        ListViewCardDrag(index),
                  ),
      );
}