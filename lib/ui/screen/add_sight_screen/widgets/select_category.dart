import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';

/// Сисок категорий мест с возможностью выбора
class SelectCategory extends StatefulWidget {
  ///
  SelectCategory({
    final Key? key,
  }) : super(key: key);

  ///
  TypePlace? typePlaceSelectedActual;

  ///
  TypePlace? typePlaceSelected;

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(final BuildContext context) {
    widget.typePlaceSelected =
        ModalRoute.of(context)?.settings.arguments as TypePlace?;

    widget.typePlaceSelectedActual = widget.typePlaceSelected;

    if (widget.typePlaceSelectedActual != widget.typePlaceSelected &&
        widget.typePlaceSelected == null) {
      widget.typePlaceSelected = widget.typePlaceSelectedActual;
    }
    return Scaffold(
      bottomSheet: bottomSheetWidget(context),
      appBar: AppBar(
        title: Text(
          category,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingPage,
                vertical: 24,
              ),
              child: ListView(
                children: <Widget>[
                  for (int i = 0;
                      i < TypePlace.values.toList().length;
                      i++) ...<Widget>[
                    elementList(TypePlace.values.toList()[i]),
                    const Divider(),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget elementList(final TypePlace typePlace) => InkWell(
        onTap: () {
          if (widget.typePlaceSelected == typePlace) {
            widget.typePlaceSelected = null;
          } else {
            widget.typePlaceSelected = typePlace;
            setState(() {});
          }
        },
        child: SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                typePlaceString(typePlace),
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              if (widget.typePlaceSelected == typePlace)
                SvgPicture.asset(
                  SvgIcons.tick,
                  color: ColorPalette.greenColor,
                ),
            ],
          ),
        ),
      );

  //Кнопка "Сохранить"
  Widget bottomSheetWidget(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage / 2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 48),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: widget.typePlaceSelected == null
                  ? MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor)
                  : MaterialStateProperty.all<Color>(ColorPalette.greenColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusCard),
                ),
              ),
            ),
            onPressed: widget.typePlaceSelected == null
                ? null
                : () {
                    Navigator.pop(context, widget.typePlaceSelected);
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  save,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: widget.typePlaceSelected == null
                            ? ColorPalette.lmFontHeadline2
                                .withOpacity(opacityText)
                            : ColorPalette.lmPrimaryColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
