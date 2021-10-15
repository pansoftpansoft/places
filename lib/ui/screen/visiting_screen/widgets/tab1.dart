import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag.dart';
import 'package:provider/provider.dart';

///
Widget tab1(final BuildContext context) => Consumer<VisitingModel>(
      builder: (
        final BuildContext context,
        final VisitingModel cart,
        final Widget? child,
      ) =>
          mocksWantVisit.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        SvgIcons.card,
                        height: 48,
                        width: 53,
                        color: ColorPalette.textInTextField
                            .withOpacity(Sizes.opacityText),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        emptyList,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        checkPlace,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: mocksWantVisit.length,
                  itemBuilder: (final BuildContext context, final int index) =>
                      ListViewCardDrag(index),
                ),
    );
