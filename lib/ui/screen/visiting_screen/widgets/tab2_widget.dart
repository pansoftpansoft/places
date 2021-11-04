import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';

/// Вкладка посещенных мест
class Tab2Widget extends StatelessWidget {
  ///
  const Tab2Widget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<VisitingModel>(
        builder: (
          final BuildContext context,
          final VisitingModel cart,
          final Widget? child,
        ) =>
            mocksVisited.isEmpty ? const EmptyListTab2() : const ListViewTab2(),
      );
}

///
class ListViewTab2 extends StatelessWidget {
  ///
  const ListViewTab2({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => ListView.builder(
        itemCount: mocksVisited.length,
        itemBuilder: (final BuildContext context, final int index) => SightCard(
          mocksVisited[index],
          iconDelete: true,
          goal: 'Цель достигнута'
              ' ${DateFormat.yMMMd().format(mocksVisited[index].visitedDate!)}',
          //key: ValueKey(mocksVisited[index].name),
          actionOnDelete: () {
            context.read<VisitingModel>().deletePlaceVisited(
                  mocksVisited[index].name,
                );
          },
        ),
      );
}

///
class EmptyListTab2 extends StatelessWidget {
  ///
  const EmptyListTab2({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              SvgIcons.go,
              height: 48,
              width: 53,
              color: ColorPalette.textInTextField.withOpacity(opacityText),
            ),
            const SizedBox(height: 32),
            Text(
              emptyList,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              completeRoute,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      );
}
