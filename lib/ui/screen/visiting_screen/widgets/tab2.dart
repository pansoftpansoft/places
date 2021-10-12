import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

Widget Tab2(BuildContext context) {
  return Consumer<VisitingModel>(
    builder: (context, cart, child) {
      return mocksVisited.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgIcons.go,
                    height: 48,
                    width: 53,
                    color: ColorPalette.textInTextField.withOpacity(Sizes.opacityText),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    Labels.emptyList,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    Labels.completeRoute,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: mocksVisited.length,
              itemBuilder: (BuildContext context, int index) {
                return SightCard(
                  mocksVisited[index],
                  iconDelete: true,
                  goal:
                      'Цель достигнута ${DateFormat.yMMMd().format(mocksVisited[index].visitedDate!)}',
                  //key: ValueKey(mocksVisited[index].name),
                  actionOnDelete: () {
                    var _visitingModel = context.read<VisitingModel>();
                    _visitingModel.deletePlaceVisited(
                      mocksVisited[index].name,
                    );
                  },
                );
              },
            );
    },
  );
}
